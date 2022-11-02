abstract class HomeEvent{}
class LoadFoodEvent extends HomeEvent{
  final String categoryName;
  LoadFoodEvent({required this.categoryName});
}
class SelectCategoryEvent extends HomeEvent{
  final int categoryIndex;
  SelectCategoryEvent({required this.categoryIndex});
}