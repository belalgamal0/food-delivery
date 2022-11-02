import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../repository/favorite_repository.dart';


class FavoritesFoodUseCase {
  final FavoriteRepository repository;
  const FavoritesFoodUseCase(this.repository);

  Future<Either<Failure, void>> call(String foodName, String boxName) async {
    return await repository.cacheFavoriteItem(foodName,boxName);
  }
}