import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _DashboardState();
}

class _DashboardState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "flutter bejir",
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}
