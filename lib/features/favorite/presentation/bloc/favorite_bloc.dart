import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/favorite_usecase.dart';
import '../../domain/usecase/is_cached_usecase.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';
import '../../../../core/failure/failure.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoritesFoodUseCase favoritesFoodUseCase;
  final IsCachedUseCase isCachedUseCase;
  
   FavoriteBloc(this.favoritesFoodUseCase,this.isCachedUseCase) : super(FavoriteInitalState()) {
    on<AddFoodFavoriteEvent>(_addFoodFavorite);
    on<CheckFavoriteFoodEvent>(_checkIfFoodFavorite);
  }

  void _addFoodFavorite(AddFoodFavoriteEvent event, Emitter<FavoriteState> emit) async {

    emit(AddingFavoriteFoodState());
    await favoritesFoodUseCase(event.categoryName,event.boxName);
  }
  void _checkIfFoodFavorite (CheckFavoriteFoodEvent event, Emitter<FavoriteState> emit) async {
    emit(LoadingFavoriteCachingState());
    final data = await isCachedUseCase(event.foodKey,event.boxName);
    _eitherLoadedOrErrorState(data,emit);
    

  }
   _eitherLoadedOrErrorState(
    Either<Failure, bool> failureOrBool,
     Emitter<FavoriteState> emit
  ) async {
     failureOrBool.fold(
      (l) => emit(FoodCachingErrorState("Failed to load data, Please try again!")),
      (isFoodCached) => emit(DoneLoadingFavoriteCachingCachingState(isFoodCached)),
    );
  }
     eitherLoadedOrErrorState(
    Either<Failure, bool> failureOrBool,
     Emitter<FavoriteState> emit
  ) async {
     failureOrBool.fold(
      (l) => emit(FoodCachingErrorState("Failed to load data, Please try again!")),
      (isFoodCached) => emit(DoneLoadingFavoriteCachingCachingState(isFoodCached)),
    );
  }
}