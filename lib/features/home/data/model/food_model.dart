import '../../domain/entity/food.dart';

class FoodModel extends Food {
  const FoodModel({
    required int id,
    required String name,
    required String description,
    required List<String> ingredients,
    required bool spicy,
    required bool vegetarian,
    required double price,
    required String image,
  }) : super(
            id: id,
            name: name,
            description: description,
            ingredients: ingredients,
            spicy: spicy,
            vegetarian: vegetarian,
            price: price,
            image: image);

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        spicy: json["spicy"],
        vegetarian: json["vegetarian"],
        price: json["price"].toDouble(),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "ingredients": List<dynamic>.from(ingredients!.map((x) => x)),
        "spicy": spicy,
        "vegetarian": vegetarian,
        "price": price,
        "image": image,
      };
}
