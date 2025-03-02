
import 'package:cart_inherited_demo/features/home/view/home_page.dart';
import 'package:cart_inherited_demo/widgets/app_state_widget.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppStateWidget(
      child: MaterialApp(
        title: "Inherited widget with Cart example",
        home: HomePage(),
      ),
    );
  }
}