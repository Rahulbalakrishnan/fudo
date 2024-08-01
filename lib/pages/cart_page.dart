import 'package:flutter/material.dart';
import 'package:fudo/components/my_button.dart';
import 'package:fudo/components/my_cart_tile.dart';
import 'package:fudo/models/restaurant.dart';
import 'package:fudo/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        // CART
        final userCart = restaurant.cart;

        return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            appBar: AppBar(
              title: const Text("Cart"),
              backgroundColor: Colors.transparent,
              foregroundColor: Theme.of(context).colorScheme.inversePrimary,
              actions: [
                // CLEAR CART
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text("Are you sure?"),
                              actions: [
                                // CANCEL
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancel")),

                                // YES
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      restaurant.clearCart();
                                    },
                                    child: const Text("Yes"))
                              ],
                            ));
                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                )
              ],
            ),
            body: Column(
              children: [
                // LIST OF CART
                Expanded(
                  child: Column(
                    children: [
                      userCart.isEmpty
                          ? Expanded(
                              child: Center(
                                  child: Text(
                              "Cart is Empty",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Theme.of(context).colorScheme.primary),
                            )))
                          : Expanded(
                              child: ListView.builder(
                                  itemCount: userCart.length,
                                  itemBuilder: (context, index) {
                                    // GET INDIVIDUAL CART ITEM
                                    final cartItem = userCart[index];
                                    return MyCartTile(cartItem: cartItem);
                                  }))
                    ],
                  ),
                ),
                // BUTTON TO PAY

                if (userCart.isNotEmpty)
                  MyButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaymentPage(),
                            ));
                      },
                      text: "Go to Checkout"),

                const SizedBox(height: 25)
              ],
            ));
      },
    );
  }
}
