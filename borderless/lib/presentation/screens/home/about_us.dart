import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:borderless/presentation/screens/aboutus/feedback_screen.dart';
import 'package:borderless/presentation/screens/aboutus/privacy_policy_screen.dart';
import 'package:borderless/presentation/screens/aboutus/terms_conditions_screen.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us", style: GoogleFonts.poppins()),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text("Feedback", style: GoogleFonts.poppins()),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackScreen())),
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text("Privacy Policy", style: GoogleFonts.poppins()),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyScreen())),
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text("Terms & Conditions", style: GoogleFonts.poppins()),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TermsConditionsScreen())),
          ),
        ],
      ),
    );
  }
}
