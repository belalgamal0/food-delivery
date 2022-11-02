import '../../domain/entity/food.dart';

abstract class HomeState {}
class HomeInitalState extends HomeState {}
class FoodLoadingState extends HomeState {}
class CategorySelectingState extends HomeState {}

class CategorySelectedState extends HomeState {}
class FoodLoadedState extends HomeState {
  final List<Food> foodList;
  FoodLoadedState({required this.foodList});
  List<Object> get props => [foodList];
}

class FoodsErrorState extends HomeState {
  final String message;
  FoodsErrorState({required this.message});
  List<Object> get props => [message];
}