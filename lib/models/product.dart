import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final double price;
  final String image;

  Product({@required this.title, this.description, this.price, this.image});
}
