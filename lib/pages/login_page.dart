import 'package:flutter/material.dart';
import 'package:fudo/components/my_button.dart';
import 'package:fudo/components/my_textfield.dart';
import 'package:fudo/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // LOGIN METHOD
  void login() async {
    // GET THE AUTH SERVICE
    final authService = AuthService();
    try {
      // TRY SIGN IN
      await authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    }
    // DISPLAY ANY ERRORS
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text(" Wrong Credentials"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LOGO
            Icon(
              Icons.fastfood,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),

            // APP SLOGAN
            Text("Food Delivery App",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary)),

            const SizedBox(height: 25),

            // EMAIL
            MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false),

            const SizedBox(height: 10),

            // PASSWORD
            MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true),

            const SizedBox(height: 10),

            // SIGN IN
            MyButton(onTap: login, text: "Sign In"),

            const SizedBox(height: 10),

            // SIGN UP
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Register now",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
