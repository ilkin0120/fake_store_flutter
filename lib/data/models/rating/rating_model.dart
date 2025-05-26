import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/rating/rating_entity.dart';

part 'rating_model.g.dart';

@JsonSerializable()
class RatingModel {
  final double rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);

  Map<String, dynamic> toJson() => _$RatingModelToJson(this);

  RatingEntity toEntity() => RatingEntity(rate: rate, count: count);

  static RatingModel fromEntity(RatingEntity entity) => RatingModel(
    rate: entity.rate,
    count: entity.count,
  );
}