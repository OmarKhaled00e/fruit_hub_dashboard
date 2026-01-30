import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/helper_functions/build_snack_bar.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductsViewBodyBlocConsumer extends StatelessWidget {
  const AddProductsViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          buildSnackBar(context, 'Product Added successfully');
        }
        if (state is AddProductFailure) {
          buildSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AddProductLoading,
          child: AddProductViewBody(),
        );
      },
    );
  }
}
