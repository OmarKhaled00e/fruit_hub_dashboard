import 'dart:io';

class AddProductInputEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final File? image;
  final String? imageUrl;
  final bool isFeatured;

  AddProductInputEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    this.imageUrl,
    required this.isFeatured,
  });
}
