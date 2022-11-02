import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_theme.dart';

class HomeEmptyFoodList extends StatelessWidget {
  final String widgetText;
  const HomeEmptyFoodList({super.key,required this.widgetText});

  @override
  Widget build(BuildContext context) {
    return Text(widgetText,
        style: AppTextTheme.black14Bold);
  }
}
