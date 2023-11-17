import 'package:e_com/modes/data.dart';
import 'package:e_com/pages/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final cardBackground = [
    const Color(0xFFECF2F4),
    const Color(0xFFFFEEDF),
    const Color(0xFFDAEDF9),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView.builder(
          itemCount: tempProduct.length,
          allowImplicitScrolling: true,
          controller: PageController(
            viewportFraction: 0.9,
          ),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => ProductDetailPage.push(
              context,
              product: tempProduct[index],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: cardBackground[index],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Hero(
                        tag: tempProduct[index].id,
                        child: SizedBox(
                          height: 300,
                          width: 500,
                          child: ModelViewer(
                            src: tempProduct[index].imageUrl,
                            autoRotate: true,
                            disableZoom: false,
                            cameraControls: false,
                            rotationPerSecond: '700%',
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tempProduct[index].tag,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade600,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Text(
                                tempProduct[index].name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Text(
                                '\$${tempProduct[index].price}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 36,
                                  color: Colors.teal.shade500,
                                  fontFamily: 'ChakraPetch',
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              color: const Color(0xFFf4f7f9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
