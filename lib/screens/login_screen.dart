import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_node_js_app/config.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void registerUser() async {
    var regBody = {
      'email': emailController.text,
      'password': passwordController.text
    };
    print(regBody);
    try {
      var response = await http.post(Uri.parse(registration),
          headers: {
            // "Access-Control-Allow-Origin": "*",
            'Content-Type': 'application/json',
          },
          body: jsonEncode(regBody));
      print(response.statusCode);
      if (response.statusCode == 200) {
        // Registration successful
        print('Registration successful');
        print(response.body);
      } else {
        // Registration failed
        print('Registration failed with status code: ${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
    print('hello dinshad');
    print(regBody);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Positioned(
            //   top: -18,
            //   left: -30,
            //   child: Image.asset(
            //     lefttopLogin,
            //   ),
            // ),
            Positioned(
                child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Log in',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 35,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email_rounded,
                            color: Color.fromARGB(255, 225, 121, 237),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'E-mail',
                          labelStyle:
                              const TextStyle(color: Colors.blueAccent)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter email address';
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Password';
                        }
                      },
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color.fromARGB(255, 225, 121, 237),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'Password',
                          labelStyle:
                              const TextStyle(color: Colors.blueAccent)),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(const Size(280, 60)),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 209, 134, 226))),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {}
                        registerUser();
                        print('dinshad');
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return ToDoListScreen();
                        // }));
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ],
              ),
            )),
            Positioned(
              bottom: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) {
                        //     return const SignupScreen();
                        //   }),
                        // );
                      },
                      child: const Text('Sign up'))
                ],
              ),
            ),
            // Positioned(
            //   bottom: -22,
            //   child: Image.asset(bottomCenterLogin),
            // )
          ],
        ),
      ),
    );
  }
}
