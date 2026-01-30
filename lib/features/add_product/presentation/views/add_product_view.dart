import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/image_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruit_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruit_hub_dashboard/core/widgets/build_app_bar.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/add_products_view_bloc_consumer.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = 'add_product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(text: 'Add Product'),
      body: BlocProvider(
        create: (context) =>
            AddProductCubit(getIt.get<ImagesRepo>(), getIt.get<ProductsRepo>()),
        child: AddProductsViewBodyBlocConsumer(),
      ),
    );
  }
}
