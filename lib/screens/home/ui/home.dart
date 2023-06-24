import 'package:bloctestapp/screens/cart/ui/cart.dart';
import 'package:bloctestapp/screens/home/bloc/home_bloc.dart';
import 'package:bloctestapp/screens/home/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc _homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    _homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: _homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Cart(),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );

          case HomeSuccessState:
            final data = state as HomeSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: Text('Clothing app'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      _homeBloc.add(HomeNavigateToCartEvent());
                    },
                    icon: Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: data.clothingProduct.length,
                itemBuilder: (context, index) {
                  return ProductItem(
                    clothingProductModel: data.clothingProduct[index],
                    homeBloc: _homeBloc,
                    // state: state,
                  );
                },
              ),
            );

          default:
            return Container();
        }
      },
    );
  }
}
