import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/data/product_data.dart';
import 'package:provider_demo/model/product_model.dart';
import 'package:provider_demo/pages/cart_page.dart';
import 'package:provider_demo/pages/favurite_page.dart';
import 'package:provider_demo/proovider/cart_provider.dart';
import 'package:provider_demo/proovider/fav_provider.dart';
import 'package:provider_demo/widgets/product_card.dart';

//product page
class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductModel> productList = ProductData().productDataList;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "Product Page",
          style: TextStyle(
              color: Colors.amber[600],
              fontSize: 22,
              fontWeight: FontWeight.w600),
        ),
      ),
      //go to favoutite page
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.amber[600],
            heroTag: "fav",
            elevation: 2,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavouritePage(),
                  ));
            },
            child: const Icon(
              Icons.favorite,
              size: 28,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          //go to cart page
          FloatingActionButton(
            backgroundColor: Colors.amber[600],
            heroTag: "cart",
            elevation: 2,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartPage(),
                  ));
            },
            child: const Icon(
              Icons.shopping_cart,
              size: 28,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: productList.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  //product item
                  ProductModel product = productList[index];
                  //define the consumer:here whaen click the cart icon the cartpage and product page should update
                  //thus the carticon is a consumer so it should wrap with consumer
                  //the value argument is the provider that the consumer get the state
                  return Consumer2<CartProvider, FavProvider>(
                    builder: (BuildContext context, CartProvider cartProvider,
                        FavProvider favProvider, child) {
                      return ProductCard(
                        name: product.proName,
                        price: product.proPrice,
                        //cart icon
                        cartColor: cartProvider.getCartItems.containsKey(
                                product.proId) //if item cotain change color
                            ? Colors.orange
                            : Colors.black54,
                        //cart item quntity
                        quntity: cartProvider.getCartItems.containsKey(
                                product.proId) //if item contain change quntity
                            ? cartProvider
                                .getCartItems[product.proId]!.itemquntity
                            : 0,
                        //add item to cart
                        addCartItem: () {
                          cartProvider.addCartItem(
                              product.proId, product.proName, product.proPrice);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text("Item is added"),
                            ),
                          );
                        },
                        //add item to fav
                        addFav: () {
                          favProvider.whenToggleFavIcon(product, context);
                        },
                        favColor:
                            favProvider.favCartItem.containsKey(product.proId)
                                ? Colors.orange
                                : Colors.black54,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
