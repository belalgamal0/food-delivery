abstract class FavoriteState {}

class FavoriteInitalState extends FavoriteState {}

class AddingFavoriteFoodState extends FavoriteState {}

class DoneAddingFavoriteFoodState extends FavoriteState {}

class ErrorSettingFavoriteFoodState extends FavoriteState {}

class LoadingFavoriteCachingState extends FavoriteState {}

class DoneLoadingFavoriteCachingCachingState extends FavoriteState {
  final bool isFoodCached;
  DoneLoadingFavoriteCachingCachingState(this.isFoodCached);
}

class FoodCachingErrorState extends FavoriteState {
  final String message;
  FoodCachingErrorState(this.message);
}
