import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'electronics_subcategories.dart'; // Import new screen

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Categories',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(24),
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        childAspectRatio: 1.1,
        children: [
          _buildCategoryItem(
            icon: 'assets/icons/electronics.jpeg',
            label: 'Electronics',
            context: context,
            navigateTo: const ElectronicsSubcategoriesScreen(), // Pass new screen
          ),
          _buildCategoryItem(
            icon: 'assets/icons/fashion.svg',
            label: 'Fashion',
            context: context,
          ),
          _buildCategoryItem(
            icon: 'assets/icons/furniture.svg',
            label: 'Furniture',
            context: context,
          ),
          _buildCategoryItem(
            icon: 'assets/icons/industrial.svg',
            label: 'Industrial',
            context: context,
          ),
          _buildCategoryItem(
            icon: 'assets/icons/home_decor.svg',
            label: 'Home Decor',
            context: context,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem({
    required String icon,
    required String label,
    required BuildContext context,
    Widget? navigateTo, // Make navigation optional
  }) {
    return GestureDetector(
      onTap: () {
        if (navigateTo != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigateTo),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(16),
              ),
              child: SvgPicture.asset(
                icon,
                colorFilter: const ColorFilter.mode(
                  Colors.black87,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

