import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/model/cart_model.dart';
import 'package:provider_demo/proovider/cart_provider.dart';
import 'package:provider_demo/widgets/cart_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  //cart page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "Cart Page",
          style: TextStyle(
              color: Colors.amber[600],
              fontSize: 22,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Consumer<CartProvider>(
        builder:
            (BuildContext context, CartProvider cartprovider, Widget? child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartprovider.getCartItems.length,
                  itemBuilder: (context, index) {
                    final CartModel cartItem =
                        cartprovider.getCartItems.values.toList()[index];

                    return CartCard(
                      name: cartItem.cartItemName,
                      price: cartItem.cartItemPrice,
                      quntity: cartItem.itemquntity,
                      removeSingleItem: () {
                        cartprovider.removeSingleItem(cartItem.cartItemId);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text("Item removed"),
                            ),
                          );
                      },
                      removeItem: () {
                        cartprovider.removeItem(cartItem.cartItemId);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text("Cart item romove"),
                            ),
                          );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
