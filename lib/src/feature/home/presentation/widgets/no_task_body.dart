import 'package:flutter/material.dart';

class NoTaskBody extends StatelessWidget {
  const NoTaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'No tasks yet!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        // const SizedBox(height: 5),
        const Text(
          'Press the button below to add a new task.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        // Here you can add more widgets or functionality as needed
      ],
    );
  }
}
