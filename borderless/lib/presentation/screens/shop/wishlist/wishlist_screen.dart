import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/wishlist/wishlist_bloc.dart';
import '../../../bloc/wishlist/wishlist_state.dart';
import 'wishlist_item.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wishlist")),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WishlistLoaded) {
            return state.wishlistItems.isEmpty
                ? const Center(child: Text("Your wishlist is empty."))
                : ListView.builder(
              itemCount: state.wishlistItems.length,
              itemBuilder: (context, index) {
                return WishlistItem(productId: state.wishlistItems[index]);
              },
            );
          } else {
            return const Center(child: Text("Something went wrong!"));
          }
        },
      ),
    );
  }
}
