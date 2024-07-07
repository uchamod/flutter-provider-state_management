import 'package:flutter/material.dart';
import 'package:provider_demo/model/product_model.dart';

class FavProvider extends ChangeNotifier {
  final Map<String, ProductModel> _cartItems = {};
  Map<String, ProductModel> get favCartItem => _cartItems;

  void whenToggleFavIcon(ProductModel product, BuildContext context) {
    if (_cartItems.containsKey(product.proId)) {
      _cartItems.remove(product.proId);
      
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 1),
            content: Text("item remove"),
          ),
        );
      
    } else {
      _cartItems.putIfAbsent(
          product.proId,
          () => ProductModel(
              proId: product.proId,
              proName: product.proName,
              proPrice: product.proPrice));
     
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 1),
            content: Text("favourite"),
          ),
        );
      
    }
    notifyListeners();
  }
}
