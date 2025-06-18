import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horziental : 16),
      child: Column(
      MainAxisAlignent: MainAxisAlignment.center,
      children: [
        CustomButton(onPressed:(){} ,text: 'Add Data',),
      ],
    ));
  }
}

