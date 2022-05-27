import 'package:flutter/material.dart';
import 'package:learning_flutter/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _name = "";
  bool changedButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/undraw_secure_login_pdn4.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Welcome $_name",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                children: [
                  // username
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: "Enter username",
                      labelText: "Username",
                    ),
                    onChanged: (value) {
                      _name = value;
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // password
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.key),
                      hintText: "Enter password",
                      labelText: "Password",
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () async {
                      setState(
                        () {
                          changedButton = true;
                        },
                      );
                      // wait before nevagating to new page/screen
                      await Future.delayed(const Duration(milliseconds: 600));
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    }, // onTap
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: changedButton ? 40 : 80,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(
                          changedButton ? 40 : 8,
                        ),
                      ),
                      child: changedButton
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),

                  //   ElevatedButton(
                  //     style: TextButton.styleFrom(
                  //       fixedSize: const Size(80, 40),
                  //     ),
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //     },
                  //     child: const Text("Login"),
                  //   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
