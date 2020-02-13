import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import './connected_products.dart';

class ProductsModel extends ConnectedProducts {
  bool _showFavorites = false;

  List<Product> get allProducts {
    return List.from(products);
  }

  List<Product> get displayedProducts {
    if (_showFavorites) {
      return products.where((Product product) => product.isFavorite).toList();
    }
    return List.from(products);
  }

  int get selectedProductIndex {
    return selProductIndex;
  }

  Product get selectedProduct {
    if (selectedProductIndex == null) {
      return null;
    }
    return products[selectedProductIndex];
  }

  bool get displayFavoritesOnly {
    return _showFavorites;
  }

  void updateProduct(
      String title, String description, String image, double price) {
    final Product updatedProduct = Product(
        title: title,
        description: description,
        image: image,
        price: price,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId);
    products[selectedProductIndex] = updatedProduct;
    selProductIndex = null;
  }

  void deleteProduct() {
    products.removeAt(selectedProductIndex);
    selProductIndex = null;
  }

  void toggleProductFavoriteStatus() {
    final bool isCurrentlyFavorite = products[selectedProductIndex].isFavorite;
    final newFavoritesStatus = !isCurrentlyFavorite;
    final Product updatedProduct = Product(
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        image: selectedProduct.image,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId,
        isFavorite: newFavoritesStatus);
    products[selectedProductIndex] = updatedProduct;
    selProductIndex = null;
    notifyListeners();
  }

  void selectProduct(int index) {
    selProductIndex = index;
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}
