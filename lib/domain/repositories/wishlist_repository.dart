abstract class WishlistRepository {
  Future<Set<int>> getWishlist();

  Future<void> toggleWishlistItem(int id);
}
