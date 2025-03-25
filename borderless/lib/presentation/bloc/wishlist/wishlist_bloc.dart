import 'package:flutter_bloc/flutter_bloc.dart';
import 'wishlist_event.dart';
import 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<AddToWishlist>(_onAddToWishlist);
    on<RemoveFromWishlist>(_onRemoveFromWishlist);
  }

  final List<String> _wishlistItems = [];

  void _onAddToWishlist(AddToWishlist event, Emitter<WishlistState> emit) {
    if (!_wishlistItems.contains(event.productId)) {
      _wishlistItems.add(event.productId);
    }
    emit(WishlistLoaded(wishlistItems: List.from(_wishlistItems)));
  }

  void _onRemoveFromWishlist(RemoveFromWishlist event, Emitter<WishlistState> emit) {
    _wishlistItems.remove(event.productId);
    emit(WishlistLoaded(wishlistItems: List.from(_wishlistItems)));
  }
}
