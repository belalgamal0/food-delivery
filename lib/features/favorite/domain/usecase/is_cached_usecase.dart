import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../repository/favorite_repository.dart';

class IsCachedUseCase{
  final FavoriteRepository repository;
  IsCachedUseCase(this.repository);

  Future<Either<Failure, bool>> call(String foodName, String boxName) async {
  return await repository.isItemCached(foodName,boxName);
  }
}