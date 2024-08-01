import 'package:flutter/material.dart';
import 'package:fudo/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  MyCurrentLocation({super.key});

  final TextEditingController textController = TextEditingController();

  void openLocationSearchBox(BuildContext context) {
    showDialog(

      context: context,
      builder: (context) =>
          AlertDialog(
            title: const Text("Your Location"),
            content:  TextField(
                controller: textController,
                decoration: const InputDecoration(hintText: "Enter address...")),
            actions: [
              // CANCEL
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),

              // SAVE
              MaterialButton(
                onPressed: () {
                  // UPDATE THE DELIVERY ADDRESS
                  String newAddress = textController.text;
                  context.read<Restaurant>().updateDeliveryAddress(newAddress);
                  Navigator.pop(context);
                  textController.clear();
                },
                child: const Text("Save"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deliver now",
            style: TextStyle(color: Theme
                .of(context)
                .colorScheme
                .primary),
          ),
          GestureDetector(
              onTap: () => openLocationSearchBox(context),
              child: Row(
                children: [
                  // ADDRESS
                  Consumer<Restaurant>(
                    builder: (context, restaurant, child) =>
                        Text(
                          restaurant.deliveryAddress,
                          style: TextStyle(
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .inversePrimary,
                              fontWeight: FontWeight.bold),
                        ),
                  ),
                  // DROPDOWN MENU
                  const Icon(Icons.keyboard_arrow_down_rounded)
                ],
              ))
        ],
      ),
    );
  }
}
