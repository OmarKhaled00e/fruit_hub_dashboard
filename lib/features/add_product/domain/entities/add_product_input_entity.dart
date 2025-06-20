import 'dart:io';

import 'package:fruit_hub_dashboard/features/add_product/domain/entities/review_entity.dart';

class AddProductInputEntity {
  final String name;
  final String code;
  final String description;
  final double price;
  final String image;
  final String imageUrl;
  final int expirationMonths;
  final int numberOfCalories;
  final int unitAmount;
  final bool isFeatured;
  final bool isOrganic;
  final List<dynamic> reviews;

  AddProductInputEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.imageUrl,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.isFeatured,
    required this.isOrganic,
    required this.reviews,
  });

  AddProductInputEntity copyWith({
    String? name,
    String? code,
    String? description,
    double? price,
    String? image,
    String? imageUrl,
    int? expirationMonths,
    int? numberOfCalories,
    int? unitAmount,
    bool? isFeatured,
    bool? isOrganic,
    List<dynamic>? reviews,
  }) {
    return AddProductInputEntity(
      name: name ?? this.name,
      code: code ?? this.code,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      imageUrl: imageUrl ?? this.imageUrl,
      expirationMonths: expirationMonths ?? this.expirationMonths,
      numberOfCalories: numberOfCalories ?? this.numberOfCalories,
      unitAmount: unitAmount ?? this.unitAmount,
      isFeatured: isFeatured ?? this.isFeatured,
      isOrganic: isOrganic ?? this.isOrganic,
      reviews: reviews ?? this.reviews,
    );
  }
}
