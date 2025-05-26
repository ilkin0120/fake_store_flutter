import '../../repositories/wishlist_repository.dart';

class ToggleWishlistItemUseCase {
  final WishlistRepository _repository;

  ToggleWishlistItemUseCase(this._repository);

  Future<void> call(int id) async {
    await _repository.toggleWishlistItem(id);
  }
}
