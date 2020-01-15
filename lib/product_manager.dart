import 'package:flutter/material.dart';
import 'package:flutter_app/product_control.dart';

import 'products.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductManager(this.products, this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: ProductControl(addProduct),
        ),
        Expanded(
          child: Products(
            products,
            deleteProduct: deleteProduct,
          ),
        )
      ],
    );
  }
}
