import 'package:flutter/material.dart';
import 'package:fudo/pages/cart_page.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySliverAppBar({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        expandedHeight: 320,
        collapsedHeight: 120,
        floating: false,
        pinned: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ));
              },
              icon: const Icon(Icons.shopping_cart))
        ],
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Little Lemon"),
        centerTitle: true,
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: child,
          ),
          title: title,
          centerTitle: true,
          titlePadding: const EdgeInsets.only(left: 0, right: 0),
          expandedTitleScale: 1,
        ));
  }
}
