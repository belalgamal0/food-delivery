import 'package:flutter/material.dart';

class IngredientsWidget extends StatelessWidget {
  final List<String>? ingredients;
  const IngredientsWidget({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        ingredients!.length,
        (index) => Text(
          ingredients![index].toString(),
        ),
      ),
    );
  }
}
