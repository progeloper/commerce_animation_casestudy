import 'dart:math' as math;

import 'package:commerce_animation_casestudy/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProductCard extends StatelessWidget {
  final AnimationController controller;
  ProductModel product;
  ProductCard({super.key, required this.controller, required this.product});

  Widget titleText(String text) => Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      );

  Widget priceText(double price) => Text(
        'N${price}',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      );

  Widget objectModel(Size size, String asset) {
    return Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: Image.asset(asset),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);

    return Container(
        height: screenSize.height * 0.4,
        width: screenSize.width * 0.8,
        decoration: BoxDecoration(
          color: product.color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText(product.title),
              priceText(product.price),
              objectModel(Size(screenSize.width * 0.7, screenSize.height * 0.2),
                  product.asset),
            ],
          ),
        ));
  }
}
