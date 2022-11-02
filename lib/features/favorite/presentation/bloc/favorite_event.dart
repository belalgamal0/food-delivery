abstract class FavoriteEvent{}
class AddFoodFavoriteEvent extends FavoriteEvent{
  final String categoryName;
  final String boxName;
  AddFoodFavoriteEvent({required this.categoryName,required this.boxName});
}
class CheckFavoriteFoodEvent extends FavoriteEvent{
  final String foodKey;
  final String boxName;
  CheckFavoriteFoodEvent({required this.foodKey,required this.boxName});
}
