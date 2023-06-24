part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeNavigateToCartEvent extends HomeEvent {}

class HomeAddToCartEvent extends HomeEvent {
  final ClothingProductModel clothingProductModel;

  HomeAddToCartEvent(this.clothingProductModel);
}
