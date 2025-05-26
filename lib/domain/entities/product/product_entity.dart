import 'package:freezed_annotation/freezed_annotation.dart';

import '../rating/rating_entity.dart';

part 'product_entity.freezed.dart';

@freezed
abstract class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    required int id,
    required String title,
    required String description,
    required String category,
    required String image,
    required double price,
    required RatingEntity rating,
  }) = _ProductEntity;
}
