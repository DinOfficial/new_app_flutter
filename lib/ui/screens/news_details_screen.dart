import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:the_daily_globe/data/helper/string_unescape.dart';
import 'package:the_daily_globe/data/models/categories_model.dart';
import 'package:the_daily_globe/data/models/news_details_models.dart';
import 'package:the_daily_globe/ui/widgets/section_title.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({super.key, required this.news});

  final CategoriesModel news;

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  late Future<NewsDetailModel> newsDetailFuture;

  @override
  void initState() {
    super.initState();
    newsDetailFuture = fetchNewsDetails(widget.news.contentApi!);
  }

  Future<NewsDetailModel> fetchNewsDetails(String contentApiUrl) async {
    final response = await http.get(Uri.parse(contentApiUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return NewsDetailModel.fromJson(data['response']);
    } else {
      throw Exception('Failed to load news details. Status Code: ${response.statusCode}');
    }
  }

  List<Widget> buildDynamicContent(Map<String, dynamic> content) {
    List<Widget> contentWidgets = [];
    var sortedKeys = content.keys.toList()
      ..sort((a, b) {
        int numA = int.tryParse(a.split('_').last) ?? 0;
        int numB = int.tryParse(b.split('_').last) ?? 0;
        return numA.compareTo(numB);
      });

    for (var key in sortedKeys) {
      var value = content[key];

      if (key.startsWith('p_') && value is String) {
        contentWidgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(value, style: TextStyle(fontSize: 16, height: 1.5)),
          ),
        );
      } else if (key.startsWith('h2_') && value is String) {
        contentWidgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
            child: Text(
              unescape(value),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        );
      } else if (key.startsWith('img_') && value is Map) {
        String? imageUrl = value['src'] ?? value['img'];
        if (imageUrl != null) {
          contentWidgets.add(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (ctx, err, st) => Icon(Icons.broken_image),
                ),
              ),
            ),
          );
        }
      }
    }
    return contentWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.news.category ?? "News Details"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              SharePlus.instance.share(ShareParams(uri: Uri.parse(widget.news.source!)));
            },
            icon: Icon(Icons.share),
          ),
        ],
      ),
      body: FutureBuilder<NewsDetailModel>(
        future: newsDetailFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Failed to load details: ${snapshot.error}'));
          }
          if (snapshot.hasData) {
            final details = snapshot.data!;
            return ListView(
              padding: EdgeInsets.all(16),
              children: [
                // main banner
                if (details.image?.img != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      details.image!.img!,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(height: 16),
                // Category
                SectionTitle(title: details.category ?? 'Uncategorized'),
                const SizedBox(height: 12),
                // Headline
                Text(
                  unescape(details.title ?? 'No Title Available'),
                  style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                // Author
                Text(
                  unescape(
                    'Author: ${details.author ?? "Unknown"}\n'
                    'Published: ${details.publishedAt ?? "N/A"}\n'
                    'Source: ${details.site ?? "N/A"}',
                  ),
                  style: TextStyle(fontSize: 12, color: Colors.grey, height: 1.5),
                ),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 12),
                ...buildDynamicContent(details.content ?? {}),
                const SizedBox(height: 24),
                if (details.source != null)
                  InkWell(
                    onTap: () {
                    },
                    child: Text(
                      'Original Source: ${details.source}',
                      style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                    ),
                  ),
              ],
            );
          }
          return Center(child: Text('No details found.'));
        },
      ),
    );
  }
}
