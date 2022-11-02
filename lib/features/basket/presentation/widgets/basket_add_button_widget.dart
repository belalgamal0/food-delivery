import 'package:flutter/material.dart';
import '../../../../core/theme/app_color_theme.dart';

class BasketAddButton extends StatelessWidget {
  final String buttonText;
  final Function buttonAction;
  const BasketAddButton(
      {super.key, required this.buttonText, required this.buttonAction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 2.5),
        decoration: BoxDecoration(
          border: Border.all(color: AppColorTheme.appPimaryColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Text(buttonText),
      ),
      onTap: () => buttonAction(),
    );
  }
}
