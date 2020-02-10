import 'package:flutter/material.dart';
import 'package:flutter_app/models/product.dart';
import 'package:scoped_model/scoped_model.dart';

import 'product_edit.dart';
import '../models/product.dart';
import '../scoped-models/products.dart';

class ProductListPage extends StatelessWidget {
  final List<Product> products;
  final Function updateProduct;
  final Function deleteProduct;

  ProductListPage(this.products, this.updateProduct, this.deleteProduct);

  Widget _buildEditButton(BuildContext context, int index) {
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        return IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            model.selectProduct(index);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return ProductEditPage();
                },
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(products[index].title),
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              deleteProduct(index);
            } else if (direction == DismissDirection.startToEnd) {
              print("Swipined start to end");
            } else {
              print("Otehr Swiping");
            }
          },
          background: Container(
            color: Colors.red,
          ),
          child: Column(
            children: <Widget>[
              ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(products[index].image),
                  ),
                  title: Text(products[index].title),
                  subtitle: Text("\$${products[index].price}"),
                  trailing: _buildEditButton(context, index)),
              Divider(),
            ],
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
