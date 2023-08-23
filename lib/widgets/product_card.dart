import 'package:commerce_animation_casestudy/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class ProductCard extends StatefulWidget {
  final AnimationController controller;
  ProductModel product;
  const ProductCard(
      {super.key, required this.controller, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
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
    return SizedBox(
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
              scale: Vector3(10, 10, 10),
              position: Vector3(0, 0, 0),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    final Size screenSize = MediaQuery.sizeOf(context);

    return const Placeholder();
  }
}
