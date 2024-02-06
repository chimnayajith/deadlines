import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Groups"),
      ),
      body: ListView(padding: EdgeInsets.all(20), children: [
        Card(
          margin: EdgeInsets.only(top: 20),
          child: ListTile(
            title: Center(
              child: Text(
                "S2 CSE A",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            minVerticalPadding: 50,
            tileColor: Color.fromARGB(200, 219, 200, 26),
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        Card(
          margin: EdgeInsets.only(top: 20),
          child: ListTile(
            title: Center(
              child: Text(
                "amFOSS",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            minVerticalPadding: 50,
            tileColor: Color.fromARGB(200, 219, 200, 26),
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
          ),
        )
      ]),
    );
  }
}
