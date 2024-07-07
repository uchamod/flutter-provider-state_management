import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final int quntity;
  final Color iconColor;
  final Function() addCartItem;
  const ProductCard(
      {super.key,
      required this.name,
      required this.price,
      required this.addCartItem,
      required this.quntity, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.withOpacity(0.1),
      child: ListTile(
        // minLeadingWidth: 80,
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        title: Row(
          children: [
            //product name
            Text(
              name,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              width: 20,
            ),
            //quintity
            Text(
              quntity.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
        //product price
        subtitle: Text(
          price.toString(),
          style: const TextStyle(
              color: Color.fromARGB(177, 0, 0, 0),
              fontSize: 14,
              fontWeight: FontWeight.w700),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            //add fav
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                size: 24,
              ),
            ),
            //add cart
            IconButton(
              onPressed: addCartItem,
              icon: Icon(
                Icons.shopping_cart,
                size: 24,
                color:iconColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
