import 'package:flutter/material.dart';

class Data{
  static List<Map<String, dynamic>> products = [
    {
      'title': 'Air Jordans',
      'price': 57999.99,
      'color': Colors.grey,
      'asset': 'assets/air_jordans_retro.obj',
    },
    {
      'title': 'Nike Sail',
      'price': 35000.00,
      'color': Colors.blueGrey[100],
      'asset': 'assets/nike_sail.stl',
    },
    {
      'title': 'NikexSupreme Uptempo',
      'price': 89999.99,
      'color': Colors.red[300],
      'asset': 'assets/nike_supreme.stl',
    },
  ];
}