import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../home/models/clothing_model.dart';
import '../data/cart_items.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartInitialEvent>((event, emit) {
      emit(CartInitialState());
      emit(CartSuccessState(cartProduct: cartItems));
    });

    on<CartRemoveFromCartEvent>((event, emit) {
      cartItems.remove(event.clothingProduct);
      emit(CartSuccessState(cartProduct: cartItems));
    });
  }
}
