part of 'wishlist_cubit.dart';

class WishlistState {
  final Set<int> ids;
  final bool isLoading;
  final String? error;

  const WishlistState({
    required this.ids,
    this.isLoading = false,
    this.error,
  });

  WishlistState copyWith({
    Set<int>? ids,
    bool? isLoading,
    String? error,
  }) {
    return WishlistState(
      ids: ids ?? this.ids,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  factory WishlistState.initial() => const WishlistState(ids: {});
}