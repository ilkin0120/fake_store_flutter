part of 'product_cubit.dart';

@immutable
class ProductState {
  final List<ProductEntity> products;
  final bool isLoading;
  final bool hasReachedMax;
  final String? error;

  const ProductState({
    required this.products,
    required this.isLoading,
    required this.hasReachedMax,
    this.error,
  });

  factory ProductState.initial() => ProductState(
    products: [],
    isLoading: false,
    hasReachedMax: false,
    error: null,
  );

  ProductState copyWith({
    List<ProductEntity>? products,
    bool? isLoading,
    bool? hasReachedMax,
    String? error,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      error: error,
    );
  }
}
