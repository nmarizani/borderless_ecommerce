import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:borderless/presentation/screens/user/account_screen.dart';
import 'package:borderless/presentation/screens/user/address_book_screen.dart';
import 'package:borderless/presentation/screens/home/profile_screen.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User", style: GoogleFonts.poppins()),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Account", style: GoogleFonts.poppins()),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen())),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text("Address Book", style: GoogleFonts.poppins()),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddressBookScreen())),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile", style: GoogleFonts.poppins()),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen())),
          ),
        ],
      ),
    );
  }
}
