import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/app_text_theme.dart';
import '../../../../core/theme/app_color_theme.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryName;
  final bool isSelected;
  final Function buttonAction;
  const CategoryWidget(
      {super.key,
      required this.categoryName,
      required this.isSelected,
      required this.buttonAction});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => buttonAction(),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: isSelected
              ? const BorderSide(color: AppColorTheme.appPimaryColor, width: 1.5)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        categoryName,
        style: AppTextTheme.black14Regular,
      ),
    );
  }
}
