class BannerModel {
  final String image;

  BannerModel({required this.image});

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(image: map['image']);
  }
}
