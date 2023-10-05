import 'package:flutter/material.dart';
import 'package:todo_app/firebase_auth/signin/signin_function.dart';
import 'package:todo_app/firebase_auth/signup/signup_page.dart';

import '../../home_page/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _signUpKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  showValue() {
    print(email);
    print(password);
  }

  goToHomePage() async {
    await Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return const Home();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SignIn")),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: _signUpKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      key: const ValueKey("email"),
                      decoration: InputDecoration(
                          hintText: "email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "email should not be empty";
                        } else if (!(value.contains("@"))) {
                          return " email is not valid";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        email = newValue.toString();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      key: const ValueKey("password"),
                      decoration: InputDecoration(
                          hintText: "password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password should not be empty";
                        } else if (value.length < 7) {
                          return "password should not less then 7";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        password = newValue.toString();
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (_signUpKey.currentState!.validate()) {
                          _signUpKey.currentState!.save();
                          showValue();
                          await signInWithEmailAndPassword(email, password);
                          goToHomePage();
                        }
                      },
                      child: const Text("SingIn")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return const SignUpPage();
                            },
                          ));
                        },
                        child: Text(
                          "SingUp",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                      )
                    ],
                  ),
                ],
              )),
        )
      ]),
    );
  }
}
