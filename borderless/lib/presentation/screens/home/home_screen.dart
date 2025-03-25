import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'categories_screen.dart';
import 'shop.dart';
import 'about_us.dart';
import 'support.dart';
import 'admin.dart';
import 'user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreenContent(), // Placeholder for home screen content
    AdminScreen(),
    UserScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToShop() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ShopScreen()));
  }

  void _navigateToCategories() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CategoriesScreen()));
  }

  void _navigateToAboutUs() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AboutUsScreen()));
  }

  void _navigateToSupport() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SupportScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: 'Admin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Text(
                'Menu',
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.store),
              title: Text('Shop', style: GoogleFonts.poppins()),
              onTap: _navigateToShop,
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text('Categories', style: GoogleFonts.poppins()),
              onTap: _navigateToCategories,
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us', style: GoogleFonts.poppins()),
              onTap: _navigateToAboutUs,
            ),
            ListTile(
              leading: Icon(Icons.support),
              title: Text('Support', style: GoogleFonts.poppins()),
              onTap: _navigateToSupport,
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to Borderless Ecommerce Hub!',
        style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }
}


