import 'package:flutter/material.dart';

void main() {
  runApp(const MainBank());
}

class MainBank extends StatelessWidget {
  const MainBank({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
