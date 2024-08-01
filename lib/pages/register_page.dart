import 'package:flutter/material.dart';
import 'package:fudo/services/auth/auth_service.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // REGISTER METHOD
  void register() async {
    // GET THE AUTH SERVICE
    final authService = AuthService();

    // CHECK IF PASSWORD MATCH -> CREATE USER
    if (passwordController.text == confirmPasswordController.text) {
      // TRY CREATING USER
      try {
        await authService.signUpWithEmailPassword(
            emailController.text, confirmPasswordController.text);
      }

      // DISPLAY ANY ERROR
      catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }

    // IF PASSWORD DON'T MATCH -> SHOW ERROR
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Password don't match!"),
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
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),
            // APP SLOGAN
            Text("Let's create an account for you",
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
            // PASSWORD - 1
            MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true),

            const SizedBox(height: 10),

            // PASSWORD - 2
            MyTextField(
                controller: confirmPasswordController,
                hintText: "Confirm Password",
                obscureText: true),

            const SizedBox(height: 10),
            // SIGN UP
            MyButton(onTap: register, text: "Sign Up"),
            const SizedBox(height: 10),

            // REGISTERED USER
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already an user? ",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Login now",
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
