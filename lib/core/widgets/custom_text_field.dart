import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_text_styles.dart';



class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon, this.onSaved, this.obscureText =false, this.maxLines = 1,
  });
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
final  void Function(String?)? onSaved;
final bool obscureText;
final int? maxLines ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyles.bold13.copyWith(color: const Color(0xFF949D9E)),
        suffixIcon: suffixIcon,
        filled: true,
        border: buildBorder(),
        enabledBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(width: 1, color: Color(0xFFE6E9E9)),
    );
  }
}
