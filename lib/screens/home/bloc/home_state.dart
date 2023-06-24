// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<ClothingProductModel> clothingProduct;

  HomeSuccessState(
    this.clothingProduct,
  );
}

class HomeNavigateToCartActionState extends HomeActionState {}
