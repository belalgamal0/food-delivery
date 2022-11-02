import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/home/domain/usecase/get_foods_usecase.dart';
import '../../../favorite/presentation/bloc/favorite_state.dart';
import '../../domain/entity/food.dart';
import 'home_events.dart';
import 'home_states.dart';
import '../../../../core/failure/failure.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetFoodsUseCase getFoodsUseCase;
  HomeBloc(this.getFoodsUseCase) : super(HomeInitalState()) {
    on<LoadFoodEvent>(_onLoadFood);
    on<SelectCategoryEvent>(_onSelectCategory);
  }
  int? selectedCategoryIndex;

  void _onSelectCategory(
      SelectCategoryEvent event, Emitter<HomeState> emit) async {
    emit(CategorySelectingState());
    selectedCategoryIndex = event.categoryIndex;
    emit(CategorySelectedState());
  }

  void _onLoadFood(LoadFoodEvent event, Emitter<HomeState> emit) async {
    emit(FoodLoadingState());
    final getFoodFeedback = await getFoodsUseCase(event.categoryName);
    _eitherLoadedOrErrorState(getFoodFeedback, emit);
  }

  _eitherLoadedOrErrorState(Either<Failure, List<Food>> failureOrFoodList,
      Emitter<HomeState> emit) async {
    failureOrFoodList.fold(
      (l) => emit(FoodsErrorState(
          message: "Failed to load data, Please try again!")),
      (foodList) => emit(FoodLoadedState(foodList: foodList)),
    );
  }
 bool isFoodSetToFavorite(FavoriteState state){
  bool isFavorite = state is DoneLoadingFavoriteCachingCachingState && state.isFoodCached;
  return isFavorite;
 }
}
