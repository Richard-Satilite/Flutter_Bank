import 'package:flutter/material.dart';
import 'package:flutter_bank/ui/styles/colors.dart';
import 'package:flutter_bank/ui/widgets/custom_form_field.dart';
import 'package:flutter_bank/utils/extensions.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _API;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/images/FbankLogo.png",
                height: 256,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 128, left: 16, right: 16, bottom: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                      Form(
                          key: _formKey,
                          child: CustomFormField(
                            validator: (val) {
                              if (!val!.isValidAPI) {
                                return "Chave API inválida.";
                              }
                              return null;
                            },
                            hintText: "API Git",
                            onSaved: (val) {
                              setState(() {
                                _API = val;
                              });
                            },
                          )),
                      SizedBox(
                        height: 64,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Navigator.pushNamed(context, "home",
                                arguments: _API);
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(AppColor.btnOrange),
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
      ),
    );
  }
}
