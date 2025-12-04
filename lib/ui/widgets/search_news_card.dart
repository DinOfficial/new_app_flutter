import 'package:flutter/material.dart';
import 'package:the_daily_globe/data/helper/string_unescape.dart';
import 'package:the_daily_globe/data/models/categories_model.dart';
import 'package:the_daily_globe/ui/screens/news_details_screen.dart';

class SearchNewsCard extends StatelessWidget {
  const SearchNewsCard({super.key, required this.news});

  final CategoriesModel news;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (news.contentApi != null && news.contentApi!.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewsDetailsScreen(news: news)),
          );
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Details are not available for this news.')));
        }
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  news.image?.img ??
                      'https://library.ceu.edu/wp-content/uploads/news-2444778_960_720.jpg',
                  height: 100,
                  width: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      'https://library.ceu.edu/wp-content/uploads/news-2444778_960_720.jpg',
                      height: 100,
                      width: 120,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      unescape(news.title ?? 'No Title Available'),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      news.publishedAt ?? 'No Date',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      news.site ?? 'Unknown Source',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
