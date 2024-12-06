import 'package:flutter/material.dart';

import '../theming/app_colors.dart';
import '../theming/app_text_styles.dart';

class AppCheckBox extends StatefulWidget {
  final String label;
  final Function(bool?) onChanged;
  const AppCheckBox({
    super.key,
    required this.label,
    required this.onChanged,
  });

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          side: const BorderSide(color: AppColors.lightGrey),
          onChanged: (value) {
            setState(() {
              isChecked = value!;
              widget.onChanged(value);
            });
          },
          activeColor: AppColors.primary,
        ),
        Text(
          widget.label,
          style: AppTextStyles.font12lighterGrey,
        ),
      ],
    );
  }
}
