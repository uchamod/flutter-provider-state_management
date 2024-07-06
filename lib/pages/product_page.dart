import 'package:flutter/material.dart';
import 'package:provider_demo/data/product_data.dart';
import 'package:provider_demo/model/product_model.dart';
import 'package:provider_demo/pages/cart_page.dart';
import 'package:provider_demo/pages/favurite_page.dart';
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
                  return ProductCard(
                      name: productList[index].proName,
                      price: productList[index].proPrice);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
