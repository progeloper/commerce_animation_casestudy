import 'package:flutter/material.dart';

class ProductModel{
  String _title;
  double _price;
  Color _color;
  String _asset;

  ProductModel({
    required String title,
    required double price,
    required Color color,
    required String asset,
  })  : _title = title,
        _price = price,
        _color = color,
        _asset = asset;

  ProductModel get product => this;

  String get asset => _asset;

  set asset(String value) {
    _asset = value;
  }

  Color get color => _color;

  set color(Color value) {
    _color = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this._title,
      'price': this._price,
      'color': this._color,
      'asset': this._asset,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      title: map['title'] as String,
      price: map['price'] as double,
      color: map['color'] as Color,
      asset: map['asset'] as String,
    );
  }
}