import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/images/FbankLogo.png",
              height: 256,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 16,
                ),
                Image.asset(
                  "assets/images/brandTitle.png",
                  width: 256,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Sistema de Gestão de contas",
                      style: TextStyle(fontSize: 32),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(label: Text("E-mail")),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(label: Text("Senha")),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "home");
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Color(0xFFFFA902)),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
