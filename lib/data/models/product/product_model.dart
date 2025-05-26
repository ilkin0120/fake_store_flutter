import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/product/product_entity.dart';
import '../rating/rating_model.dart';


part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final String image;
  final double price;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.price,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  ProductEntity toEntity() => ProductEntity(
    id: id,
    title: title,
    description: description,
    category: category,
    image: image,
    price: price,
    rating: rating.toEntity(),
  );

  static ProductModel fromEntity(ProductEntity entity) => ProductModel(
    id: entity.id,
    title: entity.title,
    description: entity.description,
    category: entity.category,
    image: entity.image,
    price: entity.price,
    rating: RatingModel.fromEntity(entity.rating),
  );
}