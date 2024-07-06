import 'package:flutter/material.dart';
import 'package:provider_demo/pages/product_page.dart';

void main() {
  runApp(const MyApp());
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
