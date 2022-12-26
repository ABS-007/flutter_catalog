import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [
        Image.asset(
          "assets/images/login.png",
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 20,
          width: 10,
        ),
        Text(
          "Welcome",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter username", labelText: "Username"),
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter password", labelText: "Password"),
                obscureText: true,
              ),
            ],
          ),
        ),
        ElevatedButton(onPressed: () {}, child: Text("Login")),
      ],
    ));
  }
}
