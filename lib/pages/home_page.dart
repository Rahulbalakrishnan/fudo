import 'package:flutter/material.dart';
import 'package:fudo/components/my_current_location.dart';
import 'package:fudo/components/my_description_box.dart';
import 'package:fudo/components/my_drawer.dart';
import 'package:fudo/components/my_food_tile.dart';
import 'package:fudo/components/my_sliver_app_bar.dart';
import 'package:fudo/components/my_tab_bar.dart';
import 'package:fudo/models/food.dart';
import 'package:fudo/models/restaurant.dart';
import 'package:fudo/pages/food_page.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // RETURN LIST OF FOOD ITEMS BASED ON THE CATEGORY
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // RETURN LIST OF FOOD IN A GIVEN CATEGORY
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      // GET CATEGORY MENU
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categoryMenu.length,
        itemBuilder: (context, index) {
          // GET INDIVIDUAL FOOD
          final food = categoryMenu[index];

          return MyFoodTile(
              food: food,
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodPage(food: food),
                  )));
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MySliverAppBar(
                    title: MyTabBar(tabController: _tabController),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Divider(
                          endIndent: 25,
                          indent: 25,
                          color: Theme.of(context).colorScheme.secondary,
                        ),

                        // LOCATION
                         MyCurrentLocation(),

                        // DESCRIPTION
                        const MyDescriptionBox()
                      ],
                    ))
              ],
          body: Consumer<Restaurant>(
            builder: (context, restaurant, child) => TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(restaurant.menu),
            ),
          )),
    );
  }
}