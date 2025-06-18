import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key, required this.isChecked, required this.onChanged});
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      child: AnimatedContainer(
        width: 24,
        height: 24,
        duration: Duration(milliseconds: 100),
        decoration: ShapeDecoration(
          color: isChecked ? AppColors.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50,
              color: isChecked ? Colors.transparent : Color(0xFFDCDEDE),
            ),
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
        ),
        child:isChecked ?  Icon(Icons.check, color: Colors.white,) : SizedBox(),
      ),
    );
  }
}
