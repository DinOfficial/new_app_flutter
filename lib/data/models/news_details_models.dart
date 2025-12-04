
import 'package:date_time_format/date_time_format.dart';

class NewsDetailModel {
  final String? id;
  final String? title;
  final String? description;
  final Map<String, dynamic>? content;
  final NewsDetailImage? image;
  final String? author;
  final String? publishedAt;
  final String? site;
  final String? category;
  final String? source;

  NewsDetailModel({
    this.id,
    this.title,
    this.description,
    this.content,
    this.image,
    this.author,
    this.publishedAt,
    this.site,
    this.category,
    this.source,
  });

  factory NewsDetailModel.fromJson(Map<String, dynamic> json) {
    return NewsDetailModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      content: json['content'] as Map<String, dynamic>?,
      image: json['image'] != null ? NewsDetailImage.fromJson(json['image']) : null,
      author: json['author'],
      publishedAt: DateTimeFormat.format(DateTime.parse(json['publishedAt']) , format: 'd - M - y'),
      site: json['site'],
      category: json['category'],
      source: json['source'],
    );
  }
}

class NewsDetailImage {
  final String? img;
  final String? alt;

  NewsDetailImage({this.img, this.alt});

  factory NewsDetailImage.fromJson(Map<String, dynamic> json) {
    return NewsDetailImage(
      img: json['img'] ?? json['src'],
      alt: json['alt'],
    );
  }
}
