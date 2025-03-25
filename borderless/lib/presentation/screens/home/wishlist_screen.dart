import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  // Sample data for wishlist items
  List<Map<String, dynamic>> wishlistItems = [
    {
      'image': 'assets/images/product1.svg',
      'title': 'Nike Air Jordan',
      'price': 120.00,
    },
    {
      'image': 'assets/images/product2.svg',
      'title': 'Classic Black Glasses',
      'price': 45.00,
    },
    {
      'image': 'assets/images/product3.svg',
      'title': 'Leather Backpack',
      'price': 85.00,
    },
  ];

  // Function to remove item from wishlist
  void removeFromWishlist(int index) {
    setState(() {
      wishlistItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wishlist',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF6C63FF),
        elevation: 0,
      ),
      body: wishlistItems.isEmpty
          ? Center(
        child: Text(
          'Your wishlist is empty!',
          style: GoogleFonts.inter(fontSize: 18),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: wishlistItems.length,
        itemBuilder: (context, index) {
          final item = wishlistItems[index];
          return WishlistItemCard(
            image: item['image'],
            title: item['title'],
            price: item['price'],
            onRemove: () => removeFromWishlist(index),
          );
        },
      ),
    );
  }
}

class WishlistItemCard extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  final VoidCallback onRemove;

  const WishlistItemCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Image placeholder
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            const SizedBox(width: 16),
            // Title and price
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$$price',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            // Remove icon
            IconButton(
              icon: Icon(Icons.remove_circle_outline),
              color: Colors.red,
              onPressed: onRemove,
            ),
          ],
        ),
      ),
    );
  }
}