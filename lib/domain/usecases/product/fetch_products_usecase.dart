import '../../entities/product/product_entity.dart';
import '../../repositories/product_repository.dart';

class FetchProductsUseCase {
  final ProductRepository _repository;

  FetchProductsUseCase(this._repository);

  Future<List<ProductEntity>> call() async => await _repository.fetchProducts();
}
