import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});
 //favourite page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        elevation: 1,
        title: Text(
          "Favourite Page",
          style: TextStyle(
              color: Colors.amber[600],
              fontSize: 22,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
