import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entity/food.dart';

abstract class FoodRepository {
  Future<Either<Failure,List<Food>>> getFoodsList(String category);
}
 