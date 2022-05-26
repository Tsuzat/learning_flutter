import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
        ),
        centerTitle: true,
      ),
      body: const Text(
        "Hello World",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}