import 'package:flutter/material.dart';

final orDivider = Row(
  children: [
    Expanded(
      child: SizedBox(
        height: 3,
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 168, 167, 166),
            Color.fromARGB(255, 36, 36, 36)
          ], begin: Alignment.centerRight, end: Alignment.center)),
        ),
      ),
    ),
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Text("OR",
          style: TextStyle(
              color: Color.fromARGB(255, 168, 167, 166),
              fontWeight: FontWeight.bold)),
    ),
    Expanded(
      child: SizedBox(
        height: 3,
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 168, 167, 166),
            Color.fromARGB(255, 36, 36, 36)
          ], begin: Alignment.centerLeft, end: Alignment.center)),
        ),
      ),
    ),
  ],
);
