import '../../repositories/wishlist_repository.dart';

class GetWishlistUseCase {
  final WishlistRepository _repository;

  GetWishlistUseCase(this._repository);

  Future<Set<int>> call() async => await _repository.getWishlist();
}
