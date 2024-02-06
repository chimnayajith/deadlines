import 'package:deadlines/components/divider.dart';
import 'package:deadlines/screens/dashboard_screen.dart';
import 'package:deadlines/screens/authentication/login_screen.dart';

import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPasswordHidden = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _displayNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool isEmailAlreadyRegistered = false;
  String? _validatePasswordMatch(String? value) {
    if (value != _passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  String? _validatePasswordStrength(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter a password.";
    }
    if (value.length < 6) {
      return "Password must be atleast 6 characters.";
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter email address";
    } else if (!RegExp(r'([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})')
        .hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter a display name.";
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    isPasswordHidden = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        './lib/assets/login.png',
                        height: 150,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        validator: _validateUsername,
                        controller: _displayNameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Color.fromARGB(255, 59, 58, 61),
                            labelText: "Display Name",
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 168, 167, 166)),
                            suffixIcon: Icon(
                              Icons.person,
                              color: Color.fromARGB(255, 168, 167, 166),
                            )),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        validator: _validateEmail,
                        controller: _emailController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            errorText: isEmailAlreadyRegistered
                                ? "Email address already registered"
                                : null,
                            border: const OutlineInputBorder(),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 59, 58, 61),
                            labelText: "Email address",
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 168, 167, 166)),
                            suffixIcon: const Icon(
                              Icons.mail_outline_outlined,
                              color: Color.fromARGB(255, 168, 167, 166),
                            )),
                        onChanged: (value) {
                          // clear submission error of email field
                          setState(() {
                            isEmailAlreadyRegistered = false;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        validator: _validatePasswordStrength,
                        controller: _passwordController,
                        style: const TextStyle(color: Colors.white),
                        obscureText: isPasswordHidden,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Color.fromARGB(255, 59, 58, 61),
                            labelText: "Password",
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 168, 167, 166)),
                            suffixIcon: Icon(Icons.password,
                                color: Color.fromARGB(255, 168, 167, 166))),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _confirmPasswordController,
                        validator: _validatePasswordMatch,
                        style: const TextStyle(color: Colors.white),
                        obscureText: isPasswordHidden,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 59, 58, 61),
                            labelText: "Confirm Password",
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
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              //  register call
                              // if (result == "done") {
                              //   Navigator.pushReplacement(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) =>
                              //               DashboardScreen()));
                              // } else if (result == 'email-already-in-use') {
                              //   setState(() {
                              //     isEmailAlreadyRegistered = true;
                              //   });
                              // }
                            }
                          },
                          child: const Text(
                            "SIGN UP",
                            style: TextStyle(fontSize: 18),
                          )),
                      const SizedBox(height: 20),
                      // orDivider,
                      // const SizedBox(height: 30),
                      // ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //         shape: ContinuousRectangleBorder(
                      //             borderRadius: BorderRadius.circular(10)),
                      //         backgroundColor: Colors.white,
                      //         maximumSize: const Size(300, 150)),
                      //     onPressed: () {},
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Image.asset(
                      //           './lib/assets/google.png',
                      //           width: 32,
                      //           height: 32,
                      //         ),
                      //         const SizedBox(width: 10),
                      //         const Text(
                      //           "Sign-up with Google",
                      //           style: TextStyle(
                      //               color: Colors.black, fontSize: 15),
                      //         )
                      //       ],
                      //     )),
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
                    "Already have an account?",
                    style: TextStyle(
                        color: Color.fromARGB(255, 168, 167, 166),
                        fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: const Text(
                      "Login!",
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
      ),
    ));
  }
}
