import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {
      'image': 'assets/images/watch.png',
      'name': 'Loop Silicone Strong Magnetic Watch',
      'price': 15.25,
      'originalPrice': 20.00,
      'quantity': 1,
    },
    {
      'image': 'assets/images/smart_watch.png',
      'name': 'M6 Smart Watch IP67 Waterproof',
      'price': 12.00,
      'originalPrice': null,
      'quantity': 1,
    },
  ];

  double shippingCost = 0.0;

  // Calculate subtotal
  double get subtotal => cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Cart', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Voucher Code', style: GoogleFonts.inter(color: const Color(0xFF6C63FF))),
          ),
        ],
      ),
      body: cartItems.isEmpty ? _buildEmptyCart() : _buildCartContent(),
    );
  }

  // 🛒 Cart Content (if items exist)
  Widget _buildCartContent() {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: cartItems.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return _buildCartItem(item, index);
            },
          ),
        ),
        _buildOrderSummary(),
      ],
    );
  }

  // 🛒 Empty Cart State
  Widget _buildEmptyCart() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/empty_cart.svg', height: 150),
            const SizedBox(height: 16),
            Text('Your cart is empty', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              'Looks like you have not added anything in your cart. Go ahead and explore top categories.',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6C63FF),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text('Explore Categories', style: GoogleFonts.inter(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  // 🛍️ Single Cart Item Widget
  Widget _buildCartItem(Map<String, dynamic> item, int index) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(item['image'], width: 60, height: 60),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['name'], style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Text('\$${item['price'].toStringAsFixed(2)}', style: GoogleFonts.inter(fontSize: 14, color: Colors.black)),
                    if (item['originalPrice'] != null) ...[
                      const SizedBox(width: 6),
                      Text('\$${item['originalPrice'].toStringAsFixed(2)}',
                          style: GoogleFonts.inter(fontSize: 12, color: Colors.red, decoration: TextDecoration.lineThrough)),
                    ],
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => _updateQuantity(index, -1),
                      icon: const Icon(Icons.remove, size: 18),
                    ),
                    Text('${item['quantity']}', style: GoogleFonts.inter(fontSize: 14)),
                    IconButton(
                      onPressed: () => _updateQuantity(index, 1),
                      icon: const Icon(Icons.add, size: 18),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => _removeItem(index),
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 📦 Order Summary
  Widget _buildOrderSummary() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal', style: GoogleFonts.inter(fontSize: 14)),
              Text('\$${subtotal.toStringAsFixed(2)}', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping Cost', style: GoogleFonts.inter(fontSize: 14)),
              Text('\$${shippingCost.toStringAsFixed(2)}', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('\$${(subtotal + shippingCost).toStringAsFixed(2)}', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6C63FF),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: Text('Checkout (${cartItems.length})', style: GoogleFonts.inter(color: Colors.white, fontSize: 16)),
          ),
        ],
      ),
    );
  }

  // 📉 Update Quantity
  void _updateQuantity(int index, int change) {
    setState(() {
      cartItems[index]['quantity'] = (cartItems[index]['quantity'] + change).clamp(1, 10);
    });
  }

  // ❌ Remove Item
  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }
}