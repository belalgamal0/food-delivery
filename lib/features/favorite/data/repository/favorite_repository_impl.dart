import 'package:dartz/dartz.dart';
import '../../domain/repository/favorite_repository.dart';
import '../../../../core/failure/exception.dart';
import '../../../../core/failure/failure.dart';
import '../datasources/favorite_local_datasource.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoritesLocalDataSource favoritesLocalDataSource;
  FavoriteRepositoryImpl({required this.favoritesLocalDataSource});
  @override
  Future<Either<Failure, void>> cacheFavoriteItem(
      String foodName, String boxName) async {
    return await _getCachedFavorites(foodName, boxName);
  }

  @override
  Future<Either<Failure, bool>> isItemCached(
      String foodName, String boxName) async {
    return await _checkCachedFavorites(foodName, boxName);
  }

  Future<Either<Failure, void>> _getCachedFavorites(
      String foodName, String boxName) async {
    try {
      final localTrivia =
          await favoritesLocalDataSource.cacheFavorites(foodName, boxName);
      return Right(localTrivia);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  Future<Either<Failure, bool>> _checkCachedFavorites(
      String foodName, String boxName) async {
    try {
      final isCachedFavorite = await favoritesLocalDataSource.isCached(foodName, boxName);
      return Right(isCachedFavorite);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
