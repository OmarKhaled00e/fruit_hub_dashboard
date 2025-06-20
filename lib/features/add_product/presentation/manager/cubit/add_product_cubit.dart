import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/core/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo.dart/products_repo.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productsRepo) : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());

    final imageResult = await imagesRepo.uploadImage(File(addProductInputEntity.image));

    await imageResult.fold(
      (failure) async => emit(AddProductFailure(failure.message)),
      (url) async {
        final updatedProduct = addProductInputEntity.copyWith(imageUrl: url);
        final productResult = await productsRepo.addProduct(updatedProduct);

        productResult.fold(
          (failure) => emit(AddProductFailure(failure.message)),
          (_) => emit(AddProductSuccess()),
        );
      },
    );
  }
}