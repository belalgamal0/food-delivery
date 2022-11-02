import '../../../home/domain/entity/food.dart';

abstract class BasketEvent {}

class UpdateBasketEvent extends BasketEvent {
  final Food foodEntity;
  UpdateBasketEvent(this.foodEntity);
}
