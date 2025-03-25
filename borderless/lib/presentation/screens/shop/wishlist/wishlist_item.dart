import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/wishlist/wishlist_bloc.dart';
import '../../../bloc/wishlist/wishlist_event.dart';

class WishlistItem extends StatelessWidget {
  final String productId;

  const WishlistItem({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text("Product ID: $productId"),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            context.read<WishlistBloc>().add(RemoveFromWishlist(productId));
          },
        ),
      ),
    );
  }
}



