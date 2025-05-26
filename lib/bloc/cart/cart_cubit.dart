import 'package:bloc/bloc.dart';

import '../../domain/entities/product/product_entity.dart';

class CartCubit extends Cubit<Map<int, int>> {
  CartCubit() : super({}); // {productId: quantity}

  void add(int productId) {
    final updated = Map<int, int>.from(state);
    updated[productId] = (updated[productId] ?? 0) + 1;
    emit(updated);
  }

  void decrease(int productId) {
    final updated = Map<int, int>.from(state);
    if (!updated.containsKey(productId)) return;

    if (updated[productId]! > 1) {
      updated[productId] = updated[productId]! - 1;
    } else {
      updated.remove(productId);
    }

    emit(updated);
  }

  void remove(int productId) {
    final updated = Map<int, int>.from(state)..remove(productId);
    emit(updated);
  }

  bool contains(int productId) => state.containsKey(productId);

  int quantity(int productId) => state[productId] ?? 0;

  double total(Map<int, ProductEntity> productMap) {
    return state.entries
        .map((entry) => (productMap[entry.key]?.price ?? 0) * entry.value)
        .fold(0.0, (a, b) => a + b);
  }
}
