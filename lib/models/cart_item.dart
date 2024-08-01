import 'package:fudo/models/food.dart';

class CartItem {
  Food food;
  List<Addon> selectedAddons;
  int quantity;

  CartItem({
    required this.food,
    required this.selectedAddons,
    this.quantity = 1
  });

  double get totalPrice {
    double addOnsPrice =
        selectedAddons.fold(0, (sum, addOn) => sum + addOn.price);
        return (food.price + addOnsPrice) * quantity;
  }
}
