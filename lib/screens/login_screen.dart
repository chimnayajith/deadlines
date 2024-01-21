import 'package:deadlines/components/divider.dart';
import 'package:deadlines/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordHidden = false;

  @override
  void initState() {
    super.initState();
    isPasswordHidden = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Log in",
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color.fromARGB(255, 59, 58, 61),
                          labelText: "Email address or username",
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 168, 167, 166)),
                          suffixIcon: Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 168, 167, 166),
                          )),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      obscureText: isPasswordHidden,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 59, 58, 61),
                          labelText: "Password",
                          labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 168, 167, 166)),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordHidden = !isPasswordHidden;
                                });
                              },
                              icon: Icon(
                                  isPasswordHidden
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: const Color.fromARGB(
                                      255, 168, 167, 166)))),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(60),
                            elevation: 10,
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 219, 200, 26)),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            //login auth
                          }
                        },
                        child: const Text(
                          "LOG IN",
                          style: TextStyle(fontSize: 18),
                        )),
                    TextButton(
                        onPressed: () {
                          // navigate to password reset screen
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Color.fromARGB(255, 168, 167, 166),
                              fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(height: 10),
                    orDivider,
                    const SizedBox(height: 30),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.white,
                            maximumSize: const Size(300, 150)),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              './lib/assets/google.png',
                              width: 32,
                              height: 32,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Sign-in with Google",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                      color: Color.fromARGB(255, 168, 167, 166), fontSize: 14),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                  child: const Text(
                    "Register!",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(200, 219, 200, 26)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
