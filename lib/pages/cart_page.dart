import 'package:flutter/material.dart';

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
    );
  }
}
