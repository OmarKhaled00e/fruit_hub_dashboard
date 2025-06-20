import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_check_box.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/is_organic_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num price, expiration, numberOfCalories, uniAmount;
  File? image;
  bool isFeatured = false;
  bool isOrganic = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
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
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  price = num.parse(value!);
                },
                hintText: 'Product Price',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                hintText: 'Product Code',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  expiration = num.parse(value!);
                },
                hintText: 'Expiration Months',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  numberOfCalories = num.parse(value!);
                },
                hintText: 'Number Of Calories',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  uniAmount = num.parse(value!);
                },
                hintText: 'Unit Amount',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  description = value!;
                },
                hintText: 'Product Description',
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              SizedBox(height: 16),
              IsOrganciCheckBox(
                onChanged: (value) {
                  isOrganic = value;
                },
              ),
              SizedBox(height: 16),
              IsFeaturedCheckBox(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),
              SizedBox(height: 16),
              ImageField(
                onFileChanged: (image) {
                  this.image = image;
                },
              ),
              SizedBox(height: 24),
              CustomButton(
                onPressed: () {
                  if (image != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      final input = AddProductInputEntity(
                        name: name,
                        code: code,
                        description: description,
                        price: price.toDouble(),
                        expirationMonths: expiration.toInt(),
                        numberOfCalories: numberOfCalories.toInt(),
                        unitAmount: uniAmount.toInt(),
                        image: image!.path,
                        isFeatured: isFeatured,
                        isOrganic: isOrganic,
                        reviews: [], imageUrl: '',
                      );
                      context.read<AddProductCubit>().addProduct(input);
                    }
                  } else {
                    showError(context);
                  }
                },
                text: 'Add Product',
              ),
              SizedBox(height: 24),
            ],
          ), // Replace with your form fields
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Plases select an image')));
  }
}
