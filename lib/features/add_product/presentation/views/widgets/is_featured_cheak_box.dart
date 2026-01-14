import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/custom_check_box.dart';
import 'package:gap/gap.dart';

class IsFeaturedCheakBox extends StatefulWidget {
  const IsFeaturedCheakBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<IsFeaturedCheakBox> createState() => _IsFeaturedCheakBoxState();
}

class _IsFeaturedCheakBoxState extends State<IsFeaturedCheakBox> {
  bool isTearmSAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'is Featured itme?',
                style: TextStyles.semiBold13.copyWith(
                  color: Color(0xff949D9E),
                ),
              ),
            ],
          ),
        ),
        Expanded(child: Gap(16)),
        CustomCheckBox(
          isChecked: isTearmSAccepted,
          onChecked: (bool value) {
            isTearmSAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
      ],
    );
  }
}
