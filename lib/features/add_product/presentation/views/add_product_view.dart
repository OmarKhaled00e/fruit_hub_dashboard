import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo.dart/products_repo.dart';
import 'package:fruit_hub_dashboard/core/services/get_it_services.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/add_products_view_body_bloc_builder.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = 'addproductview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Add Product'),
      body: BlocProvider(
        create: (context) => AddProductCubit(getIt.get<ImagesRepo>(),
        getIt.get<ProductsRepo>()
        ),
        child: AddProductsViewBodyBlocBuilder(),
      ),
    );
  }
}


