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
      body: cartProduct.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Lottie.asset(
                    'assets/animations/no_cart.json',
                  ),
                ),
                const Text(
                  'You haven\'t added to cart,',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                  ),
                )
              ],
            )
          : const Column(),
    );
  }
}
