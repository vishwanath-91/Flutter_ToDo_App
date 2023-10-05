import 'package:flutter/material.dart';
import 'package:todo_app/firebase_auth/signin/signin_page.dart';
import 'package:todo_app/firebase_auth/signup/signup_function.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _signUpKey = GlobalKey<FormState>();
  String userName = "";
  String email = "";
  String password = "";

  showValue() {
    print(userName);
    print(email);
    print(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SignUp")),
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
                      key: const ValueKey("userName"),
                      decoration: InputDecoration(
                          hintText: "User Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "User should not be empty";
                        } else if (value.length < 3) {
                          return "User should not less then 3";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        userName = newValue.toString();
                      },
                    ),
                  ),
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
                          await createUserWithEmailAndPassword(email, password);
                        }
                      },
                      child: const Text("SingUp")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return const SignInPage();
                            },
                          ));
                        },
                        child: Text(
                          "SingIn",
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
