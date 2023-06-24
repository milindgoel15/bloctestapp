import 'package:bloc/bloc.dart';
import 'package:bloctestapp/screens/cart/data/cart_items.dart';
import 'package:bloctestapp/screens/home/data/sample.dart';
import 'package:meta/meta.dart';

import '../models/clothing_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>((event, emit) async {
      emit(HomeLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      emit(HomeSuccessState(
        ClothingData.data
            .map(
              (e) => ClothingProductModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                image: e['image'],
                price: e['price'],
              ),
            )
            .toList(),
      ));
    });

    on<HomeAddToCartEvent>((event, emit) {
      print("${event.clothingProductModel.name} product added");
      cartItems.add(event.clothingProductModel);
    });

    on<HomeNavigateToCartEvent>(
      (event, emit) => emit(
        HomeNavigateToCartActionState(),
      ),
    );
  }
}
