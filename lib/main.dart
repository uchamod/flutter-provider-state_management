import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/pages/product_page.dart';
import 'package:provider_demo/proovider/cart_provider.dart';
import 'package:provider_demo/proovider/fav_provider.dart';

void main() {
  //warp with providers
  //say widget tree what notifyproviders that are use
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => CartProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => FavProvider(),
      )
    ], child: const MyApp()),
  );
}

//this is state management demo project uisng provider
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPage(),
    );
  }
}
