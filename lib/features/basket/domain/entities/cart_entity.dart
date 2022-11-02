import '../../../home/domain/entity/food.dart';

class CartItem {
  int quantity;
  final Food foodEntity;
  CartItem({required this.quantity, required this.foodEntity});
}
