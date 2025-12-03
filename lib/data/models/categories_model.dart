import 'package:date_time_format/date_time_format.dart';

class CategoriesModel {
  final String? title;
  final String? description;
  final String? publishedAt;
  final String? category;
  final String? author;
  final String? site;
  final String? contentApi;
  final ImageModel? image;

  CategoriesModel({
    this.title,
    this.description,
    this.publishedAt,
    this.category,
    this.author,
    this.site,
    this.contentApi,
    this.image,

  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      title: json['title'],
      description: json['description'],
      publishedAt: DateTimeFormat.format(DateTime.parse( json['publishedAt'],), format: 'd - M - y'),
      category: json['category'],
      author: json['author'],
      site: json['site'],
      contentApi: json['content_api'],
      image: json['image'] != null ? ImageModel.fromJson(json['image']) : null,
    );
  }
}

class ImageModel {
  final String? img;
  final String? alt;
  final String? video;

  ImageModel({this.img, this.alt, this.video});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      img: json['img'],
      alt: json['alt'],
      video: json['video'],
    );
  }
}