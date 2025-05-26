import '../../domain/repositories/wishlist_repository.dart';
import '../datasources/wishlist_local_datasource.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistLocalDataSource _local;

  WishlistRepositoryImpl(this._local);

  @override
  Future<Set<int>> getWishlist() => _local.getWishlist();

  @override
  Future<void> toggleWishlistItem(int id) => _local.toggleWishlistItem(id);
}
