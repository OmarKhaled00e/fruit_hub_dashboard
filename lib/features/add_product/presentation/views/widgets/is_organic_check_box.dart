import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/custom_check_box.dart';

class IsOrganciCheckBox extends StatefulWidget {
  const IsOrganciCheckBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<IsOrganciCheckBox> createState() => _IsOrganciCheckBoxState();
}

class _IsOrganciCheckBoxState extends State<IsOrganciCheckBox> {
  bool isOrganci = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'is Product Organic?',
                style: TextStyles.semiBold13.copyWith(color: Color(0xFF949D9E)),
              ),
            ],
          ),
        ),
        Expanded(child: SizedBox(width: 16)),
        CustomCheckBox(
          onChanged: (value) {
            isOrganci = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isOrganci,
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
