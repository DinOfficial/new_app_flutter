import 'package:flutter/material.dart';
import 'package:the_daily_globe/data/models/categories_model.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.news});

  final CategoriesModel news;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Colors.blueGrey, width: 2),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Image.network(
              news.image?.img ??
                  'https://library.ceu.edu/wp-content/uploads/news-2444778_960_720.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const SizedBox(
                  height: 200,
                  child: Center(child: CircularProgressIndicator()),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Category: ${(news.category!)}',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 8),
                Text(news.title!, style: TextStyle(fontSize: 20, color: Colors.black, overflow: TextOverflow.ellipsis),
                  maxLines: 3,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Author: ${news.author ?? "Unknown"} \n'
                      'Publish Date${news.publishedAt}\n'
                      'Source: ${news.site}',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.share, color: Colors.grey, size: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
