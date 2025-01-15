import 'package:flutter/material.dart';
import 'package:flutter_bank/ui/styles/colors.dart';

import '../models/account.dart';
import '../services/account_service.dart';
import 'widgets/account_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> refreshGetAll() async {
    return null;
  }

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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: RefreshIndicator(
          onRefresh: refreshGetAll,
          child: FutureBuilder(
            future: AccountService().getAll(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                  {
                    if (snapshot.data == null || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          "Nenhuma conta recebida",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      );
                    } else {
                      List<Account> listAccount = snapshot.data!;
                      return ListView.builder(
                        itemCount: listAccount.length,
                        itemBuilder: (context, index) {
                          return AccountWidget(account: listAccount[index]);
                        },
                      );
                    }
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}
