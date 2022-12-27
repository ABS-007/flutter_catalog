import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changebutton = false;

  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeroute);
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Form(
        key: _formkey,
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
              "Welcome $name",
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
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter username", labelText: "Username"),
                    validator: (value) {
                      if (value != null) {
                        if (value.isEmpty) {
                          return "Username cannot be empty";
                        }
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter password", labelText: "Password"),
                    validator: (value) {
                      if (value != null) {
                        if (value.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password length should be atleast 6";
                        }
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => moveToHome(context),
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                height: 50,
                width: changebutton ? 50 : 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // shape: changebutton ? BoxShape.circle : BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(changebutton ? 50 : 5),
                  color: Colors.deepPurple,
                ),
                child: changebutton
                    ? Icon(
                        Icons.done,
                        color: Colors.white,
                      )
                    : Text("Login",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
              ),
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.pushNamed(context, MyRoutes.homeroute);
            //     },
            //     child: Text("Login")),
          ],
        ),
      ),
    ));
  }
}
