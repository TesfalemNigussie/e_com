import 'package:e_com/modes/data.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          cartProduct.isEmpty ? Lottie.asset('assets/no_cart.json') : Column(),
    );
  }
}
