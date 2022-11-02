import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';

abstract class FavoriteRepository {
  Future<Either<Failure,void>> cacheFavoriteItem(String foodName, String boxName);
  Future <Either<Failure,bool>> isItemCached(String foodName, String boxName);
}