import 'package:flutter/material.dart';

class AdminBottomSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15), // Add top margin here
      child: BottomAppBar(
        color: const Color(0xFF2E7835),
      ),
    );
  }
}