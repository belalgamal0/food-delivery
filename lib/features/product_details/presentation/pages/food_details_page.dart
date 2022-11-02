import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../home/domain/entity/food.dart';
import '../widgets/ingredients_widget.dart';

class FoodDetailsPage extends StatelessWidget {
  final Food foodEntity;
  const FoodDetailsPage({super.key, required this.foodEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(foodEntity.name.toString())),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(imageUrl: foodEntity.image.toString()),
              const SizedBox(height: 15),
              Center(
                  child: Text(foodEntity.name.toString(),
                      style: AppTextTheme.black17Bold),
              ),
              const SizedBox(height: 5),
              Text(
                "${foodEntity.name} ingredients:",
                style: AppTextTheme.black14Bold,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: foodEntity.ingredients!.isEmpty
                    ? const Text("Ingredients is not available for this product.")
                    : IngredientsWidget(ingredients: foodEntity.ingredients),
              ),
              const SizedBox(height: 5),
              Text(foodEntity.spicy == true ? "Spicy" : "Not Spicy", style: AppTextTheme.black14Bold),          
            ],
          ),
        ),
      ),
    );
  }
}
