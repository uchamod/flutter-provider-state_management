import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/model/product_model.dart';
import 'package:provider_demo/proovider/fav_provider.dart';
import 'package:provider_demo/widgets/fav_card.dart';

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
      body: Consumer<FavProvider>(
        builder:
            (BuildContext context, FavProvider favprovider, Widget? child) {
          return Column(
            children: [
              Expanded(
                child: favprovider.favCartItem.isEmpty
                    ? const Center(
                        child: Text(
                          "No favourites added",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      )
                    : ListView.builder(
                        itemCount: favprovider.favCartItem.length,
                        itemBuilder: (context, index) {
                          final ProductModel item =
                              favprovider.favCartItem.values.toList()[index];

                          return FavCard(
                              name: item.proName,
                              price: item.proPrice,
                              removeFave: () {
                                favprovider.whenToggleFavIcon(item, context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text("Item removed"),
                                  ),
                                );
                              });
                        },
                      ),
              )
            ],
          );
        },
      ),
    );
  }
}
