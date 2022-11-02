import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_theme.dart';

class KeyValueWidgetText extends StatelessWidget {
  final String widgetTextKey;
  final String widgetTextValue;
  const KeyValueWidgetText({super.key, required this.widgetTextKey, required this.widgetTextValue});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            widgetTextKey,
                            style: AppTextTheme.black14Bold,
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(widgetTextValue,
                              style: AppTextTheme.black17Bold),
                        ),
                      ),
                    ],
                  ),
                );
  }
}