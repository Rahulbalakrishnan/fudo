import 'package:flutter/material.dart';
import 'package:fudo/components/my_button.dart';
import 'package:fudo/models/food.dart';
import 'package:fudo/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddOns = {};

  FoodPage({super.key, required this.food}) {
    // INITIAL ADDONS SHOULD BE FALSE
    for (Addon addon in food.availableAddons) {
      selectedAddOns[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  // METHOD TO ADD-TO-CART
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {

    // CLOSE THE FOOD PAGE AND BACK TO HOME
    Navigator.pop(context);

    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddOns[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // SCAFFOLD UI
      Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // FOOD IMAGE
                SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                        widget.food.imagePath, fit: BoxFit.cover)),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // FOOD NAME
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),

                      // FOOD PRICE
                      Text(
                        "AED ${widget.food.price}",
                        style: TextStyle(
                            color: Theme
                                .of(context)
                                .colorScheme
                                .inversePrimary,
                            fontSize: 16),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      // FOOD DESCRIPTION
                      Text(widget.food.description,
                          style: TextStyle(
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .inversePrimary,
                              fontSize: 16)),

                      const SizedBox(
                        height: 10,
                      ),

                      Divider(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .secondary,
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      Text(
                        "ADD-ONS",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme
                                .of(context)
                                .colorScheme
                                .inversePrimary),
                      ),

                      // ADD ONS
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .secondary)),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            // GET INDIVIDUAL ADDONS
                            Addon addOn = widget.food.availableAddons[index];
                            return CheckboxListTile(
                              value: widget.selectedAddOns[addOn],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddOns[addOn] = value!;
                                });
                              },
                              title: Text(
                                addOn.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Theme
                                        .of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                              subtitle: Text("AED ${addOn.price.toString()}"),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                // BUTTON
                MyButton(
                    onTap: () => addToCart(widget.food, widget.selectedAddOns),
                    text: "Add to cart"),
                const SizedBox(
                  height: 25,
                )
              ],
            ),
          )),

      // BACK BUTTON
      SafeArea(
        child: Opacity(
          opacity: 0.6,
          child: Container(
            margin: const EdgeInsets.only(left: 15, top: 15),
            decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .colorScheme
                    .secondary,
                shape: BoxShape.circle),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      )
    ]);
  }
}
