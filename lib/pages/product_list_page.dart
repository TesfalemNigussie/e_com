import 'package:e_com/modes/data.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  PageController pageController = PageController();
  bool isExpanded = false;

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Row(),
                    Hero(
                      tag: tempProduct[0].id,
                      child: SizedBox(
                        height: 300,
                        child: PageView.builder(
                          controller: pageController,
                          itemCount: tempProduct[0].colors.length,
                          itemBuilder: (context, index) => ModelViewer(
                            id: tempProduct[0].getImageUrl(index),
                            src: tempProduct[0].getImageUrl(index),
                            autoRotate: true,
                            autoPlay: true,
                            ar: false,
                            disableZoom: true,
                            cameraControls: true,
                            loading: Loading.lazy,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    isExpanded
                        ? Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Color:',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ...List.generate(
                                      tempProduct[0].colors.length,
                                      (index) => GestureDetector(
                                        onTap: () {
                                          for (var element
                                              in tempProduct[0].colors) {
                                            element.isSelected = false;
                                          }
                                          setState(() {
                                            tempProduct[0].selectedColorIndex =
                                                index;
                                            tempProduct[0]
                                                    .colors[index]
                                                    .isSelected =
                                                !tempProduct[0]
                                                    .colors[index]
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
                                            color: Color(tempProduct[0]
                                                .colors[index]
                                                .colorCode),
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: tempProduct[0]
                                                  .colors[index]
                                                  .isSelected
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
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ...List.generate(
                                      tempProduct[0].sized.length,
                                      (index) => GestureDetector(
                                        onTap: () {
                                          for (var element
                                              in tempProduct[0].sized) {
                                            element.isSelected = false;
                                          }

                                          setState(() {
                                            tempProduct[0]
                                                    .sized[index]
                                                    .isSelected =
                                                !tempProduct[0]
                                                    .sized[index]
                                                    .isSelected;
                                          });
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 15),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.grey.shade500,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            tempProduct[0]
                                                .sized[index]
                                                .sizeCode,
                                            style: TextStyle(
                                              color: tempProduct[0]
                                                      .sized[index]
                                                      .isSelected
                                                  ? Colors.black
                                                  : Colors.grey.shade500,
                                              fontWeight: tempProduct[0]
                                                      .sized[index]
                                                      .isSelected
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
            Align(
              child: InkWell(
                onTap: () => setState(() {
                  isExpanded = true;
                }),
                child: SizedBox(
                  height: isExpanded ? 0 : 350,
                  width: 500,
                ),
              ),
            ),
            isExpanded
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            const Size(double.maxFinite, 60),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                child: Container(
                                  width: double.maxFinite,
                                  padding: EdgeInsets.all(15),
                                  child: Stack(
                                    children: [
                                      Container(),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          color: Colors.white,
                                          height: 460,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '',
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      color:
                                                          Colors.grey.shade800,
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () =>
                                                        Navigator.pop(context),
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                      child: Icon(
                                                        Icons.close,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              SizedBox(
                                                height: 300,
                                                child: ModelViewer(
                                                  id: tempProduct[0]
                                                      .getImageUrl(tempProduct[
                                                              0]
                                                          .selectedColorIndex),
                                                  src: tempProduct[0]
                                                      .getImageUrl(tempProduct[
                                                              0]
                                                          .selectedColorIndex),
                                                  autoRotate: true,
                                                  autoPlay: true,
                                                  ar: false,
                                                  disableZoom: true,
                                                  cameraControls: true,
                                                  loading: null,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                      minimumSize:
                                                          MaterialStateProperty
                                                              .all(
                                                        const Size(140, 55),
                                                      ),
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                        Colors.white,
                                                      ),
                                                      elevation:
                                                          MaterialStateProperty
                                                              .all(0),
                                                      shape:
                                                          MaterialStateProperty
                                                              .all(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      showDialog(
                                                          context: context,
                                                          builder:
                                                              (context) =>
                                                                  Dialog(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          vertical:
                                                                              10,
                                                                          horizontal:
                                                                              20),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [
                                                                              GestureDetector(
                                                                                onTap: () => Navigator.pop(context),
                                                                                child: Container(
                                                                                  padding: EdgeInsets.all(5),
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(100),
                                                                                  ),
                                                                                  child: Icon(
                                                                                    Icons.close,
                                                                                    color: Colors.black,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          TextField(
                                                                            controller:
                                                                                cardNumberController,
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              labelText: 'Card Number',
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              height: 16),
                                                                          Row(
                                                                            children: [
                                                                              Expanded(
                                                                                child: TextField(
                                                                                  controller: expiryDateController,
                                                                                  keyboardType: TextInputType.number,
                                                                                  decoration: InputDecoration(
                                                                                    labelText: 'Expiry Date (MM/YY)',
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(width: 16),
                                                                              Expanded(
                                                                                child: TextField(
                                                                                  controller: cvvController,
                                                                                  keyboardType: TextInputType.number,
                                                                                  decoration: InputDecoration(
                                                                                    labelText: 'CVV',
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                              height: 32),
                                                                          ElevatedButton(
                                                                            style:
                                                                                ButtonStyle(
                                                                              minimumSize: MaterialStateProperty.all(
                                                                                const Size(140, 55),
                                                                              ),
                                                                              backgroundColor: MaterialStateProperty.all(
                                                                                Colors.white,
                                                                              ),
                                                                              elevation: MaterialStateProperty.all(0),
                                                                              shape: MaterialStateProperty.all(
                                                                                RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(4),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                              // Validate and process the credit card information
                                                                              _showPurchaseConfirmationDialog(context);
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'Purchase Now',
                                                                              style: TextStyle(
                                                                                color: Colors.black,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ));
                                                    },
                                                    child: const Text(
                                                      'checkout',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                        fontFamily: 'Poppins',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const Text(
                          'Add to cart',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  void _showPurchaseConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thank You'),
          content: Text('Thank you for your purchase!'),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  const Size(140, 55),
                ),
                backgroundColor: MaterialStateProperty.all(
                  Colors.white,
                ),
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Close the purchase confirmation dialog
                // You may want to navigate back to the home page or perform other actions
              },
              child: Text(
                'Done',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
