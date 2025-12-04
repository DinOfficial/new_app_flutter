class NewsDetailModel {
  final String? id;
  final String? title;
  final String? description;
  final Map<String, dynamic>? content;
  final Map<String, dynamic>? image;
  final String? author;
  final String? publishedAt;
  final String? site;

  NewsDetailModel({
    this.id,
    this.title,
    this.description,
    this.content,
    this.image,
    this.author,
    this.publishedAt,
    this.site,
  });

  factory NewsDetailModel.fromJson(Map<String, dynamic> json) {
    return NewsDetailModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      content: json['content'] as Map<String, dynamic>?,
      image: json['image'] as Map<String, dynamic>?,
      author: json['author'],
      publishedAt: json['publishedAt'],
      site: json['site'],
    );
  }
}
