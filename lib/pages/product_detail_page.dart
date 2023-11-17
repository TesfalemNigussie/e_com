import 'package:e_com/modes/product_model.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;

  const ProductDetailPage({super.key, required this.product});

  static push(context, {required ProductModel product}) async =>
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProductDetailPage(
            product: product,
          ),
        ),
      );

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(13),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300),
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.grey.shade600,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Hero(
                    tag: widget.product.id,
                    child: SizedBox(
                      height: 300,
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: widget.product.colors.length,
                        itemBuilder: (context, index) => ModelViewer(
                          id: widget.product.getImageUrl(index),
                          src: widget.product.getImageUrl(index),
                          autoRotate: true,
                          ar: false,
                          disableZoom: true,
                          cameraControls: true,
                          rotationPerSecond: '700%',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: DraggableScrollableSheet(
                  maxChildSize: 0.6,
                  initialChildSize: 0.3,
                  minChildSize: 0.3,
                  builder: (context, scrollController) => Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Color:',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                ...List.generate(
                                  widget.product.colors.length,
                                  (index) => GestureDetector(
                                    onTap: () {
                                      for (var element
                                          in widget.product.colors) {
                                        element.isSelected = false;
                                      }
                                      setState(() {
                                        widget.product.selectedColorIndex =
                                            index;
                                        widget.product.colors[index]
                                                .isSelected =
                                            !widget.product.colors[index]
                                                .isSelected;
                                        pageController.jumpToPage(index);
                                      });
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      decoration: BoxDecoration(
                                        color: Color(widget
                                            .product.colors[index].colorCode),
                                        border: Border.all(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: widget
                                              .product.colors[index].isSelected
                                          ? const Icon(
                                              Icons.check,
                                              size: 12,
                                            )
                                          : Container(),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Size:',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                ...List.generate(
                                  widget.product.sized.length,
                                  (index) => GestureDetector(
                                    onTap: () {
                                      for (var element
                                          in widget.product.sized) {
                                        element.isSelected = false;
                                      }

                                      setState(() {
                                        widget.product.sized[index].isSelected =
                                            !widget.product.sized[index]
                                                .isSelected;
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      decoration: BoxDecoration(
                                        color: widget
                                                .product.sized[index].isSelected
                                            ? const Color(0xFFEC7430)
                                            : Colors.white,
                                        border: Border.all(
                                          color: widget.product.sized[index]
                                                  .isSelected
                                              ? const Color(0xFFEC7430)
                                              : Colors.grey.shade500,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        widget.product.sized[index].sizeCode,
                                        style: TextStyle(
                                          color: widget.product.sized[index]
                                                  .isSelected
                                              ? Colors.white
                                              : Colors.grey.shade500,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
