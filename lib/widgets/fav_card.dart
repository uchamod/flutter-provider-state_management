import 'package:flutter/material.dart';

class FavCard extends StatelessWidget {
  final String name;
  final double price;
  final Function() removeFave;

  const FavCard(
      {super.key,
      required this.name,
      required this.price,
      required this.removeFave});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      title: Text(
        name,
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
      ),
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
          //remove fav
          IconButton(
            onPressed: removeFave,
            icon: const Icon(
              Icons.favorite,
              size: 24,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
