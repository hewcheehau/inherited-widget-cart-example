import 'package:cart_inherited_demo/app_state.dart';
import 'package:cart_inherited_demo/features/home/view/cart_widget.dart';
import 'package:cart_inherited_demo/widgets/app_state_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inherited widget with Cart"),
        centerTitle: true,
        actions: const [CartWidget(), SizedBox(width: 10,)],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Expanded(child: _MyCartShow())],
      ),
    );
  }
}

class _MyCartShow extends StatelessWidget {
  const _MyCartShow();
  @override
  Widget build(BuildContext context) {
    final data = AppStateScope.of(context);
    return Scrollbar(
      thumbVisibility: true,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...data.productList.map(
              (e) => SizedBox(
                height: 400,
                width: double.maxFinite,
                child: Column(
                  children: [
                    Image.network(
                      e.$2,
                      loadingBuilder: (context, child, loadingProgress) => Column(
                        children: [
                          if (loadingProgress != null) ...[
                            Text(loadingProgress.cumulativeBytesLoaded.toString()),
                            const CircularProgressIndicator(),
                          ] else
                            child
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("data ${e.$1}"),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: 
                      data.itemInCart.contains(e.$1) ? null :
                      () {
                        AppStateWidget.of(context).addItemToCart(e.$1);
                      },
                      child: Text(data.itemInCart.contains(e.$1) ? "Added into Cart" : "Add to Cart"),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
