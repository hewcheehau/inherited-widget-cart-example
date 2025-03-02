import 'package:cart_inherited_demo/app_state.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = AppStateScope.of(context);
    return Badge.count(
        isLabelVisible: data.itemInCart.isNotEmpty,
        count: data.itemInCart.length,
        child: GestureDetector(onTap: () {}, child: const Icon(Icons.shopping_cart)));
  }
}
