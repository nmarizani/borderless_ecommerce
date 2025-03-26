import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeeAllScreen extends StatelessWidget {
  final String title;

  const SeeAllScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset('assets/images/sample_product.png', fit: BoxFit.cover),
            ),
            title: Text("Product $index", style: GoogleFonts.inter(fontSize: 16)),
            subtitle: Text("\$${(index + 1) * 10}.00"),
            onTap: () {
              // Navigate to product detail page
            },
          );
        },
      ),
    );
  }
}
