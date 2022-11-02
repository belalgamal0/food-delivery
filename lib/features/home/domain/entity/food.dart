import 'package:equatable/equatable.dart';

class Food extends Equatable {
  const Food({
    required this.id,
    required this.name,
    required this.description,
    this.ingredients,
    required this.spicy,
    required this.vegetarian,
    required this.price,
    required this.image,
  });

  final int id;
  final String name;
  final String description;
  final List<String>? ingredients;
  final bool spicy;
  final bool vegetarian;
  final double price;
  final String image;
  @override
  List<Object?> get props =>
      [id, name, description, ingredients, spicy, vegetarian, price, image];
}
