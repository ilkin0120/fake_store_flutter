import '../../domain/entities/product/product_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _remote;

  ProductRepositoryImpl(this._remote);

  @override
  Future<List<ProductEntity>> fetchProducts() async {
    final models = await _remote.fetchProducts();
    return models.map((e) => e.toEntity()).toList();
  }
}
