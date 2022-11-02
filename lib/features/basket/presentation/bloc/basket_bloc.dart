import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/cart_entity.dart';
import 'basket_event.dart';
import 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  List<CartItem> basketItems = [];
  BasketBloc() : super(BasketInitalState()) {
    on<UpdateBasketEvent>(_updateBasket);
  }

  // Check if cart entity exists, if true increment quanitity by 1, else add cart entity to list and set quantity to 1
  void _updateBasket(UpdateBasketEvent event, Emitter<BasketState> emit) async {
    emit(UpdatingBasketState());
    int cartItemIndex = basketItems.indexWhere((element) => element.foodEntity == event.foodEntity);
    if(cartItemIndex == -1){
      basketItems.add(CartItem(foodEntity: event.foodEntity,quantity: 1));
    }else{
      basketItems[cartItemIndex].quantity ++;
    }
    emit(DoneUpdatingBasketState());
  }
}
