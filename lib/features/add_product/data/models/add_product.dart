import 'dart:io';

import 'package:fruit_hub_dashboard/features/add_product/data/models/review_model.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class AddProduct {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfColories;
  final int unitAmount;
  final int avgRating = 0;
  final int ratingCount = 0;
  final List<ReviewModel> reviews;

  AddProduct({
    required this.reviews, 
    required this.isOrganic,
    required this.expirationMonths,
    required this.numberOfColories,
    required this.unitAmount,
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
  });

  factory AddProduct.formEntity(AddProductInputEntity addProductInputEntity) {
    return AddProduct(
      reviews: addProductInputEntity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
      name: addProductInputEntity.name,
      code: addProductInputEntity.code,
      isOrganic: addProductInputEntity.isOrganic,
      description: addProductInputEntity.description,
      price: addProductInputEntity.price,
      image: addProductInputEntity.image,
      isFeatured: addProductInputEntity.isFeatured,
      expirationMonths: addProductInputEntity.expirationMonths,
      numberOfColories: addProductInputEntity.numberOfColories,
      unitAmount: addProductInputEntity.unitAmount,
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
      'unitAmount': unitAmount,
      'numberOfColories': numberOfColories,
      'expirationMonths': expirationMonths,
      'isOrganic': isOrganic,
      'reviews':reviews.map((e) => e.toJson()).toList(),
    };
  }
}
