import 'package:dartz/dartz.dart';
import '../entity/food.dart';
import '../repository/food_repository.dart';
import '../../../../core/failure/failure.dart';


class GetFoodsUseCase {
  final FoodRepository foodRepository;
  GetFoodsUseCase(this.foodRepository);

  Future<Either<Failure, List<Food>>> call(String category) async {
    return await foodRepository.getFoodsList(category);
  }
}