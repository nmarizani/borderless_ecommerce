import 'package:flutter/material.dart';

class AddressBookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Address Book")),
      body: Center(child: Text("Saved Addresses")),
    );
  }
}
