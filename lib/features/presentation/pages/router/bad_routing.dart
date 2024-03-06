import 'package:flutter/material.dart';

class BadRouting extends StatelessWidget {
  const BadRouting({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Bad routing error..'),
      ),
    );
  }
}
