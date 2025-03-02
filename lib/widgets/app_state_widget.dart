import 'package:cart_inherited_demo/app_state.dart';
import 'package:flutter/material.dart';

class AppStateWidget extends StatefulWidget {
  const AppStateWidget({super.key, required this.child});

  final Widget child;

  static AppStateWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<AppStateWidgetState>()!;
  }

  @override
  State<AppStateWidget> createState() => AppStateWidgetState();
}

class AppStateWidgetState extends State<AppStateWidget> {
  late AppState _data;

  @override
  void initState() {
    super.initState();
    _initAppData();
  }

  void _initAppData() {
    _data = AppState(productList: dummyProductList, itemInCart: {});
  }

  void addItemToCart(String id) {
    if (!_data.itemInCart.contains(id)) {
      setState(() {
        final newCart = Set<String>.from(_data.itemInCart);
        newCart.add(id);
        _data = _data.copyWith(itemInCart: newCart);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(data: _data, child: widget.child);
  }
}


const dummyProductList = [
  ("1", "https://www.machines.com.my/cdn/shop/files/iPhone16e-Web-Product_Collage_884522a2-a1ce-4081-b964-8d8191bb444a.jpg?v=1740102812&width=256"),
  ("2", "https://www.machines.com.my/cdn/shop/files/MacBook_Pro_14-in_M4_Space_Black_Pure_Front_Screen__USEN.jpg?v=1730789970&width=256"),
  ("3", "https://www.machines.com.my/cdn/shop/files/imac24inch-m3.png?v=1705457047&width=256"),
  ("4", "https://www.machines.com.my/cdn/shop/files/Apple_Watch_Series_10_46mm_Jet_Black_Hero_Front_Angle_Screen__USEN.png?v=1725927937&width=256"),
  ("5", "https://www.machines.com.my/cdn/shop/files/AirPods_4_Hero_Screen__USEN.png?v=1725927938&width=256"),
  ("6", "https://www.machines.com.my/cdn/shop/files/AirPods_Max_5-up_Hero_Screen__USEN.png?v=1725927938&width=256"),
  ("7", "https://www.machines.com.my/cdn/shop/files/HomePod_mini.png?v=1715224079&width=256")

];