import 'package:flutter/material.dart';
import 'package:fudo/models/food.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTab() {
    return FoodCategory.values.map((category) {

      return Tab(
        text: category.toString().split(".").last, );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: TabBar(
        controller: tabController,
        tabs: _buildCategoryTab(),
      ),
    );
  }
}