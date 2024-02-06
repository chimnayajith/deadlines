import 'package:deadlines/screens/authentication/login_screen.dart';

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(
          child: ElevatedButton(
        onPressed: () async {
          // loguot
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        child: Row(children: [Text("Logout"), Icon(Icons.logout)]),
      )),
    );
  }
}
