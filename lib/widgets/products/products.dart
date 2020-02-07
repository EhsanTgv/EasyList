import 'package:flutter/material.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/widgets/products/product_card.dart';

class Products extends StatelessWidget {
  final List<Product> products;

  Products(this.products);

  Widget _buildProductList() {
    Widget productCards;

    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(products[index], index),
        itemCount: products.length,
      );
    } else {
      productCards = Container();
    }

    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    print('[Product Widget] build()');
    return _buildProductList();
  }
}
