import 'package:flutter/material.dart';

class AppStateScope extends InheritedWidget {

  const AppStateScope({required super.child, required this.data, super.key});

  final AppState data;

  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateScope>()!.data;
  }

  @override
  bool updateShouldNotify(AppStateScope oldWidget) {
    return data != oldWidget.data;
  }
}

class AppState {
  AppState({required this.productList, required this.itemInCart});

  final List<(String, String)> productList;
  final Set<String> itemInCart;

  AppState copyWith({
    List<(String, String)>? productList,
    Set<String>? itemInCart,
  }) {
    return AppState(
      productList: productList ?? this.productList,
      itemInCart: itemInCart ?? this.itemInCart,
    );
  }
}
