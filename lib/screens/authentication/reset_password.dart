import 'package:deadlines/screens/authentication/login_screen.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool _emailSent = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  bool doesEmailExist = true;
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
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: _emailSent
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Image.asset(
                          './lib/assets/success.png',
                          height: 128,
                          width: 128,
                        ),
                        const SizedBox(height: 60),
                        Text(
                            "Password reset mail has been sent to ${_emailController.text}. Click on the link and reset your password!",
                            style: const TextStyle(
                                color: Colors.white54, fontSize: 16)),
                        const SizedBox(height: 60),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 10,
                              foregroundColor: Colors.white,
                              minimumSize: const Size.fromHeight(50),
                              backgroundColor:
                                  const Color.fromARGB(255, 219, 200, 26)),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: const Text("Back to Login Page"),
                        ),
                        const Spacer(),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Image.asset(
                          './lib/assets/forgot_password.png',
                          height: 128,
                          width: 128,
                        ),
                        const SizedBox(height: 60),
                        const Text(
                          "Reset Your Password",
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "Fear not! We'll email you the instructions to reset your password",
                          style: TextStyle(fontSize: 16, color: Colors.white54),
                        ),
                        const SizedBox(height: 30),
                        Form(
                          key: _formKey,
                          child: TextFormField(
                            validator: _validateEmail,
                            controller: _emailController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                errorText: !doesEmailExist
                                    ? "This email address is not registered!"
                                    : null,
                                border: const OutlineInputBorder(),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 59, 58, 61),
                                labelText: "Email address",
                                labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 168, 167, 166)),
                                suffixIcon: const Icon(
                                  Icons.mail_outline_outlined,
                                  color: Color.fromARGB(255, 168, 167, 166),
                                )),
                            onChanged: (value) {
                              setState(() {
                                doesEmailExist = true;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 10,
                              foregroundColor: Colors.white,
                              minimumSize: Size.fromHeight(50),
                              backgroundColor:
                                  const Color.fromARGB(255, 219, 200, 26)),
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              // reset passwrod call

                              setState(() {
                                _emailSent = true;
                              });
                            }
                          },
                          child: const Text("Send Mail"),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: const Text(
                            "Return to Login",
                            style: TextStyle(
                                color: Color.fromARGB(200, 219, 200, 26)),
                          ),
                        )
                      ],
                    ),
            )),
      ),
    );
  }
}
