import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ElectronicsSubcategoriesScreen extends StatelessWidget {
  const ElectronicsSubcategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> subcategories = [
      {"icon": "assets/icons/phones.svg", "label": "Phones"},
      {"icon": "assets/icons/laptops.svg", "label": "Laptops"},
      {"icon": "assets/icons/tvs.svg", "label": "TVs & Monitors"},
      {"icon": "assets/icons/audio.svg", "label": "Audio & Sound"},
      {"icon": "assets/icons/gaming.svg", "label": "Gaming"},
      {"icon": "assets/icons/accessories.svg", "label": "Accessories"},
    ];

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
          'Electronics',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
          childAspectRatio: 1.1,
        ),
        itemCount: subcategories.length,
        itemBuilder: (context, index) {
          return _buildSubcategoryItem(
            icon: subcategories[index]["icon"]!,
            label: subcategories[index]["label"]!,
          );
        },
      ),
    );
  }

  Widget _buildSubcategoryItem({required String icon, required String label}) {
    return Container(
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
    );
  }
}
