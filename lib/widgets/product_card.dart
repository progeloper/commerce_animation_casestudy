import 'dart:math' as math;

import 'package:commerce_animation_casestudy/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProductCard extends StatefulWidget {
  ProductModel product;
  ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500),)..forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget titleText(String text) => Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      );

  Widget priceText(double price) => Text(
        'N$price',
        style: const TextStyle(
          color: Colors.white38,
          fontSize: 16,
          fontWeight: FontWeight.w400,
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
    Animation animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    double opacityValue = 0.0;

    return VisibilityDetector(
      key: Key(widget.product.title),
      onVisibilityChanged: (visibilityInfo){
        var visiblePercentage = visibilityInfo.visibleFraction * 100;
        if(visiblePercentage<80){
          opacityValue = animation.value;
          controller.forward();
        }
      },
      child: Container(
          height: screenSize.height * 0.4,
          width: screenSize.width * 0.8,
          decoration: BoxDecoration(
            color: widget.product.color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AnimatedOpacity(
              opacity: animation.value,
              duration: const Duration(milliseconds: 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleText(widget.product.title),
                  priceText(widget.product.price),
                  objectModel(Size(screenSize.width * 0.7, screenSize.height * 0.2),
                      widget.product.asset),
                ],
              ),
            ),
          )),
    );
  }

}
