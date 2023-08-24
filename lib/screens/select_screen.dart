import 'package:commerce_animation_casestudy/constants/data.dart';
import 'package:commerce_animation_casestudy/models/product_model.dart';
import 'package:commerce_animation_casestudy/widgets/product_card.dart';
import 'package:flutter/material.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen>
    with TickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<AnimationController> _controllers = [];

  @override
  void initState() {
    super.initState();
    Data.products.forEach((element) {
      _controllers.add(
        AnimationController(vsync: this, duration: const Duration(seconds: 10)),
      );
    });
  }

  @override
  void dispose() {
    _controllers.forEach((element) {
      element.dispose();
    });
  }

  List<ProductCard> get _children => List.generate(
        Data.products.length,
        (index) => ProductCard(
          controller: _controllers[index],
          product: ProductModel.fromMap(Data.products[index]),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenSize.height * 0.4,
                child: PageView(
                  children: _children,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
