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
            viewportFraction: 0.8,
          ),
          itemBuilder: (context, index) => Stack(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: cardBackground[index],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Row(),
                      Hero(
                        tag: tempProduct[index].id,
                        child: SizedBox(
                          height: 300,
                          child: ModelViewer(
                            src: tempProduct[index].imageUrl,
                            autoRotate: true,
                            autoPlay: true,
                            cameraControls: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                child: InkWell(
                  onTap: () => ProductDetailPage.push(
                    context,
                    product: tempProduct[index],
                  ),
                  child: SizedBox(
                    height: 350,
                    width: 500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
