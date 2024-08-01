import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:fudo/firebase_options.dart';
import 'package:fudo/models/restaurant.dart';
import 'package:fudo/services/auth/auth_gate.dart';
import 'package:fudo/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        // THEME
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        // RESTAURANT
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const AuthGate(),
    );
  }
}
