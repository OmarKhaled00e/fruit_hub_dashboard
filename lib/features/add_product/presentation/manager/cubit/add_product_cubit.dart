import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/image_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productsRepo)
    : super(AddProductInitial());
  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(AddProductInputEntity addProcutInputEntity) async {
    emit(AddProductLoading());
    // ignore: unused_local_variable
    var result = await imagesRepo.uploadImage(addProcutInputEntity.image!);
    result.fold(
      (f) {
        emit(AddProductFailure(errMessage: f.message));
      },
      (url) async {
        addProcutInputEntity.imageUrl = url;
        var result = await productsRepo.addProduct(addProcutInputEntity);
        result.fold(
          (f) {
            emit(AddProductFailure(errMessage: f.message));
          },
          (r) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
