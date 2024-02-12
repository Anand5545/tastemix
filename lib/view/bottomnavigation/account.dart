import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Account"),
      ),
    );
  }
}

void _MyAccount(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => MyAccount()));
}
