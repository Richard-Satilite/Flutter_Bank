import 'package:flutter/material.dart';
import 'package:flutter_bank/ui/widgets/custom_form_field.dart';
import 'package:flutter_bank/utils/extensions.dart';
import 'package:uuid/uuid.dart';

import '../../models/account.dart';
import '../../services/account_service.dart';
import '../styles/colors.dart';

class AddAccountModal extends StatefulWidget {
  final String API;
  const AddAccountModal({super.key, required this.API});

  @override
  State<AddAccountModal> createState() => _AddAccountModalState();
}

class _AddAccountModalState extends State<AddAccountModal> {
  String _accountType = "1A";
  final _formKey = GlobalKey<FormState>();
  late String _API;
  String? _name;
  String? _lastName;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _API = widget.API;
  }

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
          child: Form(
            key: _formKey,
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
                CustomFormField(
                  hintText: "Nome",
                  validator: (val) {
                    if (!val!.isValidNameLastName) {
                      return "Nome Inválido.";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      _name = val;
                    });
                  },
                ),
                CustomFormField(
                  hintText: "Sobrenome",
                  validator: (val) {
                    if (!val!.isValidNameLastName) {
                      return "Sobrenome Inválido.";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      _lastName = val;
                    });
                  },
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
                            onPressed:
                                (isLoading) ? null : onButtonCancelClicked,
                            child: Text("Cancelar"))),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          onButtonSendClicked(_API);
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(AppColor.btnOrange)),
                      child: (isLoading)
                          ? Transform.scale(
                              scale: 0.5,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text("Adicionar"),
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onButtonCancelClicked() {
    if (!isLoading) {
      closeModal();
    }
  }

  onButtonSendClicked(String API) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      String name = _name!;
      String lastName = _lastName!;

      Account account = Account(
        id: const Uuid().v1(),
        name: name,
        lastName: lastName,
        balance: 0,
        accountType: _accountType,
      );

      await AccountService(gistKey: API).addAccount(account);
      closeModal();
    }
  }

  closeModal() {
    Navigator.pop(context);
  }
}
