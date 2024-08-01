import 'package:flutter/material.dart';
import 'package:fudo/components/my_drawer_tile.dart';
import 'package:fudo/pages/settings_page.dart';
import 'package:fudo/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    // GET THE AUTH SERVICE
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // APP LOGO
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              Icons.fastfood,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          // HOME
          MyDrawerTile(
              onTap: () => Navigator.pop(context),
              text: "HOME",
              icon: Icons.home),

          // SETTINGS
          MyDrawerTile(
              onTap: () => {
                    Navigator.pop(context),
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsPage()))
                  },
              text: "SETTINGS",
              icon: Icons.settings),

          const Spacer(),

          // LOGOUT
          MyDrawerTile(onTap: logout, text: "LOGOUT", icon: Icons.logout),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
