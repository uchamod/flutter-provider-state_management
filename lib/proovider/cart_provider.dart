import 'package:flutter/material.dart';
import 'package:provider_demo/model/cart_model.dart';

class CartProvider extends ChangeNotifier {
  //cart items
  final Map<String, CartModel> _items = {};
  //get cart item state
  Map<String, CartModel> get getCartItems {
    return {..._items};
  }

  void addCartItem(String productId, String productName, double productPrice) {
    //if item already exist : update the item quntity
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existItem) => CartModel(
            cartItemId: existItem.cartItemId,
            cartItemName: existItem.cartItemName,
            cartItemPrice: existItem.cartItemPrice,
            itemquntity: existItem.itemquntity + 1),
      );
      print("update existing item");
      //otherwise add as new item
    } else {
      _items.putIfAbsent(
        productId,
        () => CartModel(
            cartItemId: productId,
            cartItemName: productName,
            cartItemPrice: productPrice,
            itemquntity: 1),
      );
      print("add new item");
    }
    //notify listners when state is updated
    notifyListeners();
  }
}
