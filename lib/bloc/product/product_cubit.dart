import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/product/product_entity.dart';
import '../../domain/usecases/product/fetch_products_usecase.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required FetchProductsUseCase fetchProductsUseCase})
    : _fetchProductsUseCase = fetchProductsUseCase,
      super(ProductState.initial());
  final FetchProductsUseCase _fetchProductsUseCase;

  final int _chunkSize = 5;
  List<ProductEntity> _allProducts = [];
  int _currentChunk = 0;

  Future<void> loadInitial() async {
    emit(state.copyWith(isLoading: true));
    try {
      _allProducts = await _fetchProductsUseCase();
      _currentChunk = 0;
      _loadNextChunk();
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> loadMore() async {
    if (state.isLoading || state.hasReachedMax) return;
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(milliseconds: 300));
    _loadNextChunk();
  }

  void _loadNextChunk() {
    final nextChunk =
        _allProducts.skip(_currentChunk * _chunkSize).take(_chunkSize).toList();

    if (nextChunk.isEmpty) {
      emit(state.copyWith(hasReachedMax: true, isLoading: false));
    } else {
      _currentChunk++;
      emit(
        state.copyWith(
          products: [...state.products, ...nextChunk],
          isLoading: false,
        ),
      );
    }
  }
}
