import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_cheak_box.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/is_organic_check_box.dart';
import 'package:gap/gap.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String name, code, description;
  late num price, expirationMonths, numberOfCalories, unitAmount;
  File? image;
  bool isFeatured = false;
  bool isOrganic = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: _fromKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: 'Product Name',
                textInputType: TextInputType.text,
              ),
              Gap(16),
              CustomTextFormField(
                onSaved: (value) {
                  price = num.parse(value!);
                },
                hintText: 'Product Price',
                textInputType: TextInputType.number,
              ),
              Gap(16),
              CustomTextFormField(
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                hintText: 'Product Code',
                textInputType: TextInputType.number,
              ),
              Gap(16),
              CustomTextFormField(
                onSaved: (value) {
                  expirationMonths = num.parse(value!);
                },
                hintText: 'Expiration Month',
                textInputType: TextInputType.number,
              ),
              Gap(16),
              CustomTextFormField(
                onSaved: (value) {
                  numberOfCalories = num.parse(value!);
                },
                hintText: 'Number of Calories',
                textInputType: TextInputType.number,
              ),
              Gap(16),
              CustomTextFormField(
                onSaved: (value) {
                  unitAmount = num.parse(value!);
                },
                hintText: 'Unit Amount',
                textInputType: TextInputType.number,
              ),
              Gap(16),
              CustomTextFormField(
                onSaved: (value) {
                  description = value!;
                },
                hintText: 'Product Description',
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              Gap(16),
              IsFeaturedCheakBox(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),
              Gap(16),
              IsOrganicCheakBox(
                onChanged: (value) {
                  isOrganic = value;
                },
              ),
              Gap(16),
              ImageField(
                onFileChanged: (image) {
                  this.image = image;
                },
              ),
              Gap(24),
              CustomButtton(
                onPressed: () {
                  if (image != null) {
                    if (_fromKey.currentState!.validate()) {
                      _fromKey.currentState!.save();
                      AddProductInputEntity input = AddProductInputEntity(
                        name: name,
                        code: code,
                        reviews: [],
                        description: description,
                        price: price,
                        image: image!,
                        isFeatured: isFeatured,
                        expirationsMonths: expirationMonths.toInt(),
                        numberOfCalories: numberOfCalories.toInt(),
                        unitAmount: unitAmount.toInt(),
                        isOrganic:isOrganic,
                      );
                      context.read<AddProductCubit>().addProduct(input);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    showError(context);
                  }
                },
                text: 'Add Product',
              ),
              Gap(24),
            ],
          ),
        ),
      ),
    );
  }
}

void showError(BuildContext context) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text('Please select an image')));
}
