// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bloctestapp/screens/home/bloc/home_bloc.dart';
import 'package:bloctestapp/screens/home/models/clothing_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.clothingProductModel,
    required this.homeBloc,
  }) : super(key: key);

  final ClothingProductModel clothingProductModel;
  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.network(
                clothingProductModel.image,
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      clothingProductModel.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$${clothingProductModel.price.toString()}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border_outlined),
                        ),
                        IconButton(
                          onPressed: () {
                            homeBloc
                                .add(HomeAddToCartEvent(clothingProductModel));
                          },
                          icon: Icon(Icons.shopping_bag_outlined),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(clothingProductModel.description),
          ),
        ],
      ),
    );
  }
}
