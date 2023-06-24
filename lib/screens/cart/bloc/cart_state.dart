// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {
  final List<ClothingProductModel> cartProduct;
  CartSuccessState({
    required this.cartProduct,
  });
}
