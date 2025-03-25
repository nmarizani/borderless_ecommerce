import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:borderless/presentation/screens/admin/admin_dashboard_screen.dart';
import 'package:borderless/presentation/screens/admin/analytics_screen.dart';
import 'package:borderless/presentation/screens/admin/manage_orders_screen.dart';
import 'package:borderless/presentation/screens/admin/manage_products_screen.dart';
import 'package:borderless/presentation/screens/admin/manage_users_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin", style: GoogleFonts.poppins()),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text("Dashboard", style: GoogleFonts.poppins()),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen())),
          ),
          ListTile(
            leading: Icon(Icons.analytics),
            title: Text("Analytics", style: GoogleFonts.poppins()),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AnalyticsScreen())),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Manage Orders", style: GoogleFonts.poppins()),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ManageOrdersScreen())),
          ),
          ListTile(
            leading: Icon(Icons.inventory),
            title: Text("Manage Products", style: GoogleFonts.poppins()),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ManageProductsScreen())),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Manage Users", style: GoogleFonts.poppins()),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ManageUsersScreen())),
          ),
        ],
      ),
    );
  }
}
