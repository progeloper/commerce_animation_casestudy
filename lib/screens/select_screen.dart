import 'package:commerce_animation_casestudy/constants/data.dart';
import 'package:commerce_animation_casestudy/models/product_model.dart';
import 'package:commerce_animation_casestudy/widgets/product_card.dart';
import 'package:flutter/material.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  List<ProductCard> get _children => List.generate(
        Data.products.length,
        (index) => ProductCard(
          product: ProductModel.fromMap(Data.products[index]),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenSize.height * 0.4,
                child: PageView.builder(
                  itemCount: _children.length,
                  itemBuilder: (context, index){
                    return _children[index];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
