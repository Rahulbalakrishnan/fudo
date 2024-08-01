import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fudo/models/food.dart';
import 'package:intl/intl.dart';

import 'cart_item.dart';

class Restaurant extends ChangeNotifier {
  // LIST OF FOOD ITEMS
  final List<Food> _menu = [
    // BURGER
    Food(
        name: "Bob Burger",
        description:
            "One piece Grilled Steak with Bob Burger Sauce, Lettuce, Tomatoes, Cheese Pickles",
        imagePath: "lib/images/burgers/1.jpg",
        price: 35.00,
        category: FoodCategory.burger,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),
    Food(
        name: "Keto Burger",
        description:
            "Beef patty consist of 150 gram of the American angus wrapped with iceberg lettuce, American cheese, and slice of Tomato",
        imagePath: "lib/images/burgers/2.jpg",
        price: 35.00,
        category: FoodCategory.burger,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),
    Food(
        name: "Chicken Burger",
        description:
            "Fried chicken slice with special sauce, coleslaw salad and cheese.",
        imagePath: "lib/images/burgers/3.jpg",
        price: 40.00,
        category: FoodCategory.burger,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),
    Food(
        name: "Beef Burger",
        description:
            "Grilled Steak with Bob burger Sauce, Lettuce, Cheetos Cheese.",
        imagePath: "lib/images/burgers/4.jpg",
        price: 40.00,
        category: FoodCategory.burger,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),
    Food(
        name: "Chicken Burger",
        description:
            "Fried Chicken Slice with Pomegranate Sauce, Pomegranate Seeds, Watercress Cheese",
        imagePath: "lib/images/burgers/5.jpg",
        price: 40.00,
        category: FoodCategory.burger,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),

    // HOTDOGS
    Food(
        name: "Classic HotDog",
        description: "Angus beef Hotdog with special sauce and crispy onions.",
        imagePath: "lib/images/hotdogs/1.jpg",
        price: 32.00,
        category: FoodCategory.dogs,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),
    Food(
        name: "Cheetos HotDog",
        description:
            "Angus beef Hotdog covered with Cheetos with special sauce.",
        imagePath: "lib/images/hotdogs/2.jpg",
        price: 36.00,
        category: FoodCategory.dogs,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),
    Food(
        name: "Bob Hotdog",
        description: "Angus beef Hotdog with bob sauce and Oman chips.",
        imagePath: "lib/images/hotdogs/3.jpg",
        price: 36.00,
        category: FoodCategory.dogs,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),
    Food(
        name: "Dbs Hot Dog",
        description:
            "Angus beef Hotdog with pomegranate sauce and pomegranate seeds.",
        imagePath: "lib/images/hotdogs/4.jpg",
        price: 32.00,
        category: FoodCategory.dogs,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),
    Food(
        name: "Special HotDog",
        description:
            "Angus beef Hotdog with hot sauce, crispy onions and jalapeno.",
        imagePath: "lib/images/hotdogs/5.jpg",
        price: 36.00,
        category: FoodCategory.dogs,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),

    // SANDWICHES
    Food(
        name: "Chicken Sandwich",
        description:
            "A piece of fried chicken with special sauce covered with cheetos.",
        imagePath: "lib/images/sandwiches/1.jpg",
        price: 34.00,
        category: FoodCategory.sando,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),
    Food(
        name: "Shrimp Sandwich",
        description: "Fried Shrimp with Bechamel Sauce place in Potato Bread.",
        imagePath: "lib/images/sandwiches/2.jpg",
        price: 34.00,
        category: FoodCategory.sando,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),
    Food(
        name: "Bob Cheetos",
        description: "Slices of Meat with Special Sauce Cheetos.",
        imagePath: "lib/images/sandwiches/3.jpg",
        price: 29.00,
        category: FoodCategory.sando,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),
    Food(
        name: "Brisket Sandwich",
        description:
            "Grilled Brisket With Teriyaki Sauce And Mushroom Put In Sandwich Buns.",
        imagePath: "lib/images/sandwiches/4.jpg",
        price: 32.00,
        category: FoodCategory.sando,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),

    //SIDES
    Food(
        name: "Brisket Fingers",
        description:
            "Slice bread with cheddar cheese , mozzarella cheese and brisket beef with special sauce.",
        imagePath: "lib/images/sides/1.jpg",
        price: 29.00,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),
    Food(
        name: "Buffalo Shrimp",
        description:
            "Fried Shrimp covered with Buffalo Sauce with Ranch Sauce.",
        imagePath: "lib/images/sides/2.jpg",
        price: 38.00,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),
    Food(
        name: "French Fries",
        description: "Best french fries in town, Made out of best potatoes.",
        imagePath: "lib/images/sides/3.jpg",
        price: 10.00,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),
    Food(
        name: "Crispy Curls",
        description:
            "Best french fries with a twist, Made out of best potatoes.",
        imagePath: "lib/images/sides/4.jpg",
        price: 13.00,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),
    Food(
        name: "Bob Dynamite ",
        description: "Yummy Dynamite Shrimp covered with Cheetos.",
        imagePath: "lib/images/sides/5.jpg",
        price: 25.00,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),

    // DRINKS
    Food(
        name: "Virgin Mojito",
        description: "Mojito.",
        imagePath: "lib/images/drinks/1.jpg",
        price: 12.00,
        category: FoodCategory.drink,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),
    Food(
        name: "Mojito RB",
        description: "Mojito Red Bull.",
        imagePath: "lib/images/drinks/2.jpg",
        price: 24.00,
        category: FoodCategory.drink,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),
    Food(
        name: "Red Bull",
        description: "Red Bull Gives You Wings",
        imagePath: "lib/images/drinks/3.jpg",
        price: 16.00,
        category: FoodCategory.drink,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),
    Food(
        name: "American Soda",
        description: "The natural fruit flavoured soda from latin american",
        imagePath: "lib/images/drinks/4.jpg",
        price: 5.00,
        category: FoodCategory.drink,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),
    Food(
        name: "Soft drinks",
        description: "A mix of soft drinks",
        imagePath: "lib/images/drinks/5.jpg",
        price: 6.00,
        category: FoodCategory.drink,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.50),
          Addon(name: "Bacon", price: 0.50),
          Addon(name: "Avocado", price: 0.50),
        ]),
  ];

  // DELIVERY ADDRESS
  String _deliveryAddress = "Dubai Sports city";

// GETTERS
  // GT: 1. GET THE MENU
  List<Food> get menu => _menu;

  // GT: 2. GET THE CART ITEM
  List<CartItem> get cart => _cart;

  String get deliveryAddress => _deliveryAddress;

// OPERATIONS

  // USER CART
  final List<CartItem> _cart = [];

// OP: 1. ADD TO THE CART
  void addToCart(Food food, List<Addon> selectedAddons) {
    // CHECK IF THERE IS A CART ITEM ALREADY HAS THE SAME FOOD AND ADDONS
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // CHECK IF THE FOOD IS SAME
      bool isSameFood = item.food == food;
      // CHECK IF THE ADDON IS SAME
      bool isSameAddon =
          const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddon;
    });
    // IF ITEM ALREADY EXIST INCREASE QUANTITY
    if (cartItem != null) {
      cartItem.quantity++;
    }
    // ADD NEW CART ITEM
    else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  // OP: 2. REMOVE FROM THE CART
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    // IF EXIST
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // OP: 3. GET TOTAL PRICE OF THE CART
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // OP: 4. GET TOTAL NUMBER OF ITEMS IN THE CART
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  // OP: 5. CLEAR THE ITEMS IN THE CART
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // OP: 6 UPDATE THE DELIVERY ADDRESS
  void updateDeliveryAddress(String newAddress){
    _deliveryAddress = newAddress;
    notifyListeners();
  }

// HELPERS
  // HP: 1. GENERATE RECEIPTS
  String displayCartReceipts() {
    final receipts = StringBuffer();
    receipts.writeln("Here's your receipts.");
    receipts.writeln();

    // FORMAT THE DATE TO INCLUDE PTO SECONDS
    String formattedDate =
        DateFormat('yyyy-MM-dd--HH:mm:ss').format(DateTime.now());
    receipts.writeln(formattedDate);
    receipts.writeln();
    receipts.writeln("-----------------");

    // RECEIPTS DATA
    for (final cartItem in _cart) {
      receipts.writeln(" ${cartItem.quantity} x "
          "${cartItem.food.name} -"
          " ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipts.writeln("Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipts.writeln();
    }

    // RECEIPTS SUMMARY
    receipts.writeln("-----------------");
    receipts.writeln();
    receipts.writeln("Total items: ${getTotalItemCount()}");
    receipts.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipts.writeln();
    receipts.writeln("Delivering to: $deliveryAddress");

    return receipts.toString();
  }

  // HP: 2. FORMAT DOUBLE VALUES INTO MONEY
  String _formatPrice(double price) {
    return "AED ${price.toStringAsFixed(2)}";
  }

  // HP: 3. FORMAT LIST OF ADD-ONS INTO STRING SUMMARY
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(",");
  }
}
