class ProductModel {
  String id;
  String name;
  String imageUrl;
  bool isFavorite;
  String description;
  String tag;
  int price;
  int selectedColorIndex = 0;
  List<ColorModel> colors;
  List<SizeModel> sized;
  int rating;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.selectedColorIndex,
    required this.description,
    required this.colors,
    required this.tag,
    required this.sized,
    required this.isFavorite,
    required this.rating,
    required this.imageUrl,
  });

  getImageUrl(index) => imageUrl.replaceAll('0', index);
}

class ColorModel {
  int colorCode;
  bool isSelected;

  ColorModel({required this.colorCode, required this.isSelected});
}

class SizeModel {
  String sizeCode;
  bool isSelected;

  SizeModel({required this.sizeCode, required this.isSelected});
}
