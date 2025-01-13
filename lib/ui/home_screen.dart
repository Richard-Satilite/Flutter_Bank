import 'package:flutter/material.dart';
import 'package:flutter_bank/ui/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.lightGrey,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'login');
            },
            icon: Icon(Icons.arrow_back),
          ),
        ],
        title: Text("Sistema de Gestão de Contas"),
      ),
    );
  }
}
