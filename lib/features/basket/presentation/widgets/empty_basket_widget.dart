import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/app_text_theme.dart';

class EmptyBasketWidget extends StatelessWidget {
  const EmptyBasketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Your basket is empty currently.",
          style: AppTextTheme.black14Bold),
    );
  }
}
