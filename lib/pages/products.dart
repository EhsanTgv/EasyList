import 'package:flutter/material.dart';
import 'package:flutter_app/models/product.dart';

import '../widgets/products/products.dart';

class ProductsPage extends StatelessWidget {
  final List<Product> products;

  ProductsPage(this.products);

  Widget _buildSideDrawer(BuildContext context){
    return Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text("choose"),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text("Manage Products"),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/admin");
              },
            )
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
        ],
        title: Text('EasyList'),
      ),
      body: Products(products),
    );
  }
}
