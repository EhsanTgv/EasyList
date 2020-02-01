import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePage();
  }
}

class _ProductCreatePage extends State<ProductCreatePage> {
  String _titleValue = "";
  String _descriptionValue = "";
  double _priceValue;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Product Title"),
      onSaved: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Product Description"),
      maxLines: 4,
      onSaved: (String value) {
        setState(() {
          _descriptionValue = value;
        });
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Product Price"),
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      },
    );
  }

  void _submitForm() {
    _formKey.currentState.save();
    final Map<String, dynamic> product = {
      "title": _titleValue,
      "description": _descriptionValue,
      "price": _priceValue,
      "image": "assets/food.jpg"
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;

    return Container(
      margin: EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: targetPadding),
          children: <Widget>[
            _buildTitleTextField(),
            _buildDescriptionTextField(),
            _buildPriceTextField(),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              textColor: Colors.white,
              child: Text("Save"),
              onPressed: _submitForm,
            ),
          ],
        ),
      ),
    );
  }
}
