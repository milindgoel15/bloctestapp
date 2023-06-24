import 'package:bloctestapp/screens/cart/bloc/cart_bloc.dart';
import 'package:bloctestapp/screens/cart/widgets/cart_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc _cartBloc = CartBloc();

  @override
  void initState() {
    super.initState();
    _cartBloc.add(CartInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: _cartBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartLoadingState:
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );

            case CartSuccessState:
              final data = state as CartSuccessState;
              if (data.cartProduct.isEmpty) {
                return const Center(
                  child: Text('Cart is empty!'),
                );
              }
              return ListView.builder(
                itemCount: data.cartProduct.length,
                itemBuilder: (context, index) {
                  return CartProduct(
                    clothingProductModel: data.cartProduct[index],
                    cartBloc: _cartBloc,
                  );
                },
              );

            default:
              return const Center(
                child: Text('Cart is empty!'),
              );
          }
        },
      ),
    );
  }
}
