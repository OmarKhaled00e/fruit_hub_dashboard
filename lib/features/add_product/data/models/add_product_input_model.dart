import 'dart:io';

import 'package:fruit_hub_dashboard/features/add_product/data/models/review_model.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File? image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final List<ReviewModel> reviews;

  AddProductInputModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.reviews,
    this.imageUrl,
    required this.isFeatured,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.isOrganic = false,
  });

  factory AddProductInputModel.fromEntity(
    AddProductInputEntity addProductInputEntity,
  ) {
    return AddProductInputModel(
      reviews: addProductInputEntity.reviews
          .map((e) => ReviewModel.fromEntity(e))
          .toList(),
      name: addProductInputEntity.name,
      code: addProductInputEntity.code,
      description: addProductInputEntity.description,
      price: addProductInputEntity.price,
      image: addProductInputEntity.image,
      isOrganic: addProductInputEntity.isOrganic,
      isFeatured: addProductInputEntity.isFeatured,
      unitAmount: addProductInputEntity.unitAmount,
      numberOfCalories: addProductInputEntity.numberOfCalories,
      expirationsMonths: addProductInputEntity.expirationsMonths,
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
