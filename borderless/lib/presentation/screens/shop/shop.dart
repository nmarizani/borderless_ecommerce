import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:borderless/presentation/screens/shop/product_screen.dart';
import 'package:borderless/presentation/screens/home/my_cart.dart';
import 'package:borderless/presentation/screens/shop/orders.dart';
import 'package:borderless/presentation/screens/home/wishlist_screen.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop", style: GoogleFonts.poppins()),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text("Products", style: GoogleFonts.poppins()),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsScreen())),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Cart", style: GoogleFonts.poppins()),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen())),
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("Orders", style: GoogleFonts.poppins()),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersScreen())),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Wishlist", style: GoogleFonts.poppins()),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WishlistScreen())),
          ),
        ],
      ),
    );
  }
}
