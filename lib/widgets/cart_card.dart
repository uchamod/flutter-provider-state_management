import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  final String name;
  final double price;
  final int quntity;
  final Function() removeSingleItem;
  final Function() removeItem;
  const CartCard(
      {super.key,
      required this.name,
      required this.price,
      required this.quntity,
      required this.removeSingleItem,
      required this.removeItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      title: Row(
        children: [
          //product name
          Text(
            name,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            width: 20,
          ),
          //quintity
          Text(
            quntity.toString(),
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
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
            onPressed: removeSingleItem,
            icon: const Icon(
              Icons.remove
              ,
              size: 24,
            ),
          ),
          //add cart
          IconButton(
            onPressed: removeItem,
            icon: const Icon(
              Icons.remove_shopping_cart,
              size: 24,
            ),
          )
        ],
      ),
    );
  }
}
