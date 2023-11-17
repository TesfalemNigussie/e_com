import 'package:e_com/modes/product_model.dart';

final tempProduct = [
  ProductModel(
    id: '123',
    name: "",
    tag: "",
    selectedColorIndex: 0,
    description: "",
    price: 0,
    isFavorite: false,
    colors: [
      ColorModel(colorCode: 0xFF000000, isSelected: false),
      ColorModel(colorCode: 0xFFFFFFFF, isSelected: false),
      ColorModel(colorCode: 0xFFF808080, isSelected: false),
    ],
    sized: [
      SizeModel(sizeCode: "S", isSelected: false),
      SizeModel(sizeCode: "M", isSelected: false),
      SizeModel(sizeCode: "L", isSelected: false),
    ],
    rating: 3,
    imageUrl: 'assets/animations/egg_0.glb',
  ),
  // ProductModel(
  //   id: '12345',
  //   name: "GUCCI MINI BAG",
  //   selectedColorIndex: 0,
  //   tag: "Women's Bag",
  //   price: 4500,
  //   description:
  //       " Gucci is a renowned luxury fashion brand, and the Horsebit 1955 collection refers to a series of bags inspired by a design from the brand's archives.",
  //   colors: [
  //     ColorModel(colorCode: 0xFF00000, isSelected: false),
  //     ColorModel(colorCode: 0xFFec1c24, isSelected: false),
  //     ColorModel(colorCode: 0xFFfff200, isSelected: false),
  //   ],
  //   isFavorite: false,
  //   sized: [
  //     SizeModel(sizeCode: "Large", isSelected: false),
  //     SizeModel(sizeCode: "Medium", isSelected: false),
  //   ],
  //   rating: 2,
  //   imageUrl: 'assets/animations/bag_0.glb',
  // ),
  // ProductModel(
  //   id: '12345678',
  //   isFavorite: false,
  //   selectedColorIndex: 0,
  //   name: "NIKE T-SHIRT",
  //   tag: "Mens Tops",
  //   price: 123,
  //   description:
  //       " Nike T-shirts come in various styles, designs, and materials, catering to different preferences and activities.",
  //   colors: [
  //     ColorModel(colorCode: 0xFF00a8f3, isSelected: false),
  //     ColorModel(colorCode: 0xFFb83dba, isSelected: false),
  //   ],
  //   sized: [
  //     SizeModel(sizeCode: "W 5 / M 3.5", isSelected: false),
  //     SizeModel(sizeCode: "W 5.5 / M 4", isSelected: false),
  //   ],
  //   rating: 5,
  //   imageUrl: 'assets/animations/shirt_0.glb',
  // )
];

final cartProduct = [];
