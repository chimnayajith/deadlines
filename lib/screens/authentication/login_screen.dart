import 'package:deadlines/components/divider.dart';
import 'package:deadlines/screens/authentication/reset_password.dart';
import 'package:deadlines/screens/dashboard_screen.dart';
import 'package:deadlines/screens/authentication/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // controllers for email and password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isPasswordHidden = false;
  bool isInvalidCredentials = false;
  @override
  void initState() {
    super.initState();
    isPasswordHidden = true;
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
                        "Log in",
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _emailController,
                        validator: _validateEmail,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            errorText: isInvalidCredentials
                                ? "Invalid credentials!"
                                : null,
                            border: const OutlineInputBorder(),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 59, 58, 61),
                            labelText: "Email address",
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 168, 167, 166)),
                            suffixIcon: const Icon(
                              Icons.person,
                              color: Color.fromARGB(255, 168, 167, 166),
                            )),
                        onChanged: (value) {
                          setState(() {
                            isInvalidCredentials = false;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Required Field";
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        obscureText: isPasswordHidden,
                        decoration: InputDecoration(
                            errorText: isInvalidCredentials
                                ? "Invalid credentials!"
                                : null,
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
                        onChanged: (value) {
                          setState(() {
                            isInvalidCredentials = false;
                          });
                        },
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
                              // if (result == "done") {
                              //   Navigator.pushReplacement(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) =>
                              //               DashboardScreen()));
                              // } else if (result == "invalid-credential") {
                              //   setState(() {
                              //     isInvalidCredentials = true;
                              //   });
                              // }
                            }
                          },
                          child: const Text(
                            "LOG IN",
                            style: TextStyle(fontSize: 18),
                          )),
                      const SizedBox(height: 10),

                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ResetPasswordScreen()));
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Color.fromARGB(255, 168, 167, 166),
                                fontWeight: FontWeight.bold),
                          )),
                      // orDivider,
                      // const SizedBox(height: 30),
                      // ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //         shape: ContinuousRectangleBorder(
                      //             borderRadius: BorderRadius.circular(10)),
                      //         backgroundColor: Colors.white,
                      //         maximumSize: const Size(300, 150)),
                      //     onPressed: () {
                      //       _authUtils.signInWithGoogle();
                      //     },
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
                      //           "Sign-in with Google",
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
                    "Don't have an account?",
                    style: TextStyle(
                        color: Color.fromARGB(255, 168, 167, 166),
                        fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
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
      ),
    ));
  }
}
