import 'dart:math' as math;

import 'package:commerce_animation_casestudy/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProductCard extends StatelessWidget {
  final AnimationController controller;
  ProductModel product;
  ProductCard(
      {super.key, required this.controller, required this.product});

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
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Cube(
          interactive: true,
          onSceneCreated: (scene) {
            scene.camera.position.z = 10;
            scene.world.add(
              Object(
                fileName: asset,
                lighting: true,
                scale: Vector3(7, 7, 7),
                position: Vector3(0, 0, 0),
                rotation: Vector3(0, controller.value * 2 * math.pi, 0),
              ),
            );
          },
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleText(product.title),
            priceText(product.price),
            objectModel(Size(screenSize.width*0.5, screenSize.height*0.4), product.asset),
          ],
        ),
      )
    );
  }
}
