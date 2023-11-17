import 'package:e_com/modes/product_model.dart';

final tempProduct = [
  ProductModel(
    id: '123',
    name: "Air Jordan 1 Mid ",
    tag: "Women's Shoes",
    selectedColorIndex: 0,
    description:
        "The Air Jordan 1 Mid is a popular sneaker that belongs to the iconic Air Jordan line produced by Nike in collaboration with basketball legend Michael Jordan. The Air Jordan 1 Mid is a mid-top version of the classic Air Jordan 1, which was first released in 1985. The Mid version retains the key design elements of the original but with a slightly lower cut, making it a versatile and stylish option for both casual wear and on-court performance.",
    price: 123,
    isFavorite: false,
    colors: [
      ColorModel(colorCode: 0xFFec1c24, isSelected: false),
      ColorModel(colorCode: 0xFFb83dba, isSelected: false),
      ColorModel(colorCode: 0xFF3f48cc, isSelected: false),
    ],
    sized: [
      SizeModel(sizeCode: "W 5 / M 3.5", isSelected: false),
      SizeModel(sizeCode: "W 5.5 / M 4", isSelected: false),
    ],
    rating: 3,
    imageUrl: 'assets/animations/egg_0.glb',
  ),
  ProductModel(
    id: '12345',
    name: "GUCCI MINI BAG",
    selectedColorIndex: 0,
    tag: "Women's Bag",
    price: 4500,
    description:
        " Gucci is a renowned luxury fashion brand, and the Horsebit 1955 collection refers to a series of bags inspired by a design from the brand's archives. Horsebit Detail: The Horsebit is a signature Gucci motif that features a metal ornament resembling a horse's snaffle bit. It's a classic and iconic element often incorporated into Gucci's designs.",
    colors: [
      ColorModel(colorCode: 0xFF00000, isSelected: false),
      ColorModel(colorCode: 0xFFec1c24, isSelected: false),
      ColorModel(colorCode: 0xFFfff200, isSelected: false),
    ],
    isFavorite: false,
    sized: [
      SizeModel(sizeCode: "Large", isSelected: false),
      SizeModel(sizeCode: "Medium", isSelected: false),
    ],
    rating: 2,
    imageUrl: 'assets/animations/bag_0.glb',
  ),
  ProductModel(
    id: '12345678',
    isFavorite: false,
    selectedColorIndex: 0,
    name: "NIKE T-SHIRT",
    tag: "Mens Tops",
    price: 123,
    description:
        " Nike T-shirts come in various styles, designs, and materials, catering to different preferences and activities. While I can't provide details on specific Nike T-shirts without a particular model or collection name, I can give you a general overview of what you might expect from Nike T-shirts:",
    colors: [
      ColorModel(colorCode: 0xFF00a8f3, isSelected: false),
      ColorModel(colorCode: 0xFFb83dba, isSelected: false),
    ],
    sized: [
      SizeModel(sizeCode: "W 5 / M 3.5", isSelected: false),
      SizeModel(sizeCode: "W 5.5 / M 4", isSelected: false),
    ],
    rating: 5,
    imageUrl: 'assets/animations/shirt_0.glb',
  )
];

final cartProduct = [];
