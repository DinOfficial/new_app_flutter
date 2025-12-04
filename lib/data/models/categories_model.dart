
import 'package:date_time_format/date_time_format.dart';

class CategoriesModel {
  String? id;
  String? title;
  String? description;
  Map<String, dynamic>? content;
  ImageModel? image;
  String? language;
  String? publishedAt;
  String? source;
  String? site;
  String? category;
  String? author;
  String? contentApi;

  CategoriesModel({
    this.id,
    this.title,
    this.description,
    this.content,
    this.image,
    this.language,
    this.publishedAt,
    this.source,
    this.site,
    this.category,
    this.author,
    this.contentApi
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      content: json['content'] as Map<String, dynamic>?,
      image: json['image'] != null ? ImageModel.fromJson(json['image']) : null,
      language: json['language'],
      publishedAt: DateTimeFormat.format(DateTime.parse(json['publishedAt']) , format: 'd - M - y'),
      source: json['source'],
      site: json['site'],
      category: json['category'],
      author: json['author'],
      contentApi: json['content_api'],
    );
  }
}

class ImageModel {
  String? img;
  String? alt;

  ImageModel({this.img, this.alt});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      img: json['src'] ?? json['img'],
      alt: json['alt'],
    );
  }
}
