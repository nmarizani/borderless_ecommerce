import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:borderless/presentation/screens/support/contact_us_screen.dart';
import 'package:borderless/presentation/screens/support/faq_screen.dart';
import 'package:borderless/presentation/screens/support/help_center_screen.dart';
import 'package:borderless/presentation/screens/support/live_chat_screen.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Support", style: GoogleFonts.poppins()),
        backgroundColor: Colors.purpleAccent,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text("Contact Us", style: GoogleFonts.poppins()),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsScreen())),
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text("FAQ", style: GoogleFonts.poppins()),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FAQScreen())),
          ),
          ListTile(
            leading: Icon(Icons.help_center),
            title: Text("Help Center", style: GoogleFonts.poppins()),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HelpCenterScreen())),
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text("Live Chat", style: GoogleFonts.poppins()),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LiveChatScreen())),
          ),
        ],
      ),
    );
  }
}
