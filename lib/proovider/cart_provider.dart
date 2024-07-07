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

  //remove all items
  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  //remove item
  void removeItem(String cartId) {
    _items.remove(cartId);
    notifyListeners();
  }

  //remove single bud from item
  void removeSingleItem(String productid) {
    if (!_items.containsKey(productid)) {
      return;
    } else if (_items[productid]!.itemquntity > 1) {
      _items.update(
        productid,
        (existItem) => CartModel(
          cartItemId: existItem.cartItemId,
          cartItemName: existItem.cartItemName,
          cartItemPrice: existItem.cartItemPrice,
          itemquntity: existItem.itemquntity - 1,
        ),
      );
    } else {
      _items.remove(productid);
    }

    notifyListeners();
  }

  //get total amount
  double get totalPrice {
    double total = 0;
    _items.forEach(
      (key, item) {
        total += item.cartItemPrice * item.itemquntity;
      },
    );
     
    return total;
      
  }
}
