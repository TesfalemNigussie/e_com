import 'package:e_com/pages/product_list_page.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selectedTab == 0 ? const ProductListPage() : const CartPage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() {
          selectedTab = index;
        }),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.add_shopping_cart_outlined),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Text(
                      '10',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
