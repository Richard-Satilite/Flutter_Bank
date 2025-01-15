import 'package:flutter/material.dart';

import '../styles/colors.dart';

class AddAccountModal extends StatefulWidget {
  const AddAccountModal({super.key});

  @override
  State<AddAccountModal> createState() => _AddAccountModalState();
}

class _AddAccountModalState extends State<AddAccountModal> {
  String _accountType = "1A";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      width: MediaQuery.of(context).size.width * 0.95,
      child: Padding(
        padding: EdgeInsets.only(
            left: 32,
            right: 32,
            top: 32,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/newUser.png",
                height: 128,
              ),
              Text(
                "Adicionar nova conta!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Insira as informações da nova conta",
                style: TextStyle(fontSize: 18),
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text("Nome")),
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text("Sobrenome")),
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text("Saldo")),
              ),
              SizedBox(height: 16),
              const Text("Tipo de conta"),
              DropdownButton<String>(
                value: _accountType,
                isExpanded: true,
                items: [
                  DropdownMenuItem(value: "1A", child: Text("1A")),
                  DropdownMenuItem(value: "1B", child: Text("1B")),
                  DropdownMenuItem(value: "2A", child: Text("2A")),
                  DropdownMenuItem(value: "2B", child: Text("2B")),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _accountType = value;
                    });
                  }
                },
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Cancelar"))),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(AppColor.btnOrange)),
                    child: Text("Adicionar"),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
