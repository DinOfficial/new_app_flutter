import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
  });

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
              'https://library.ceu.edu/wp-content/uploads/news-2444778_960_720.jpg',
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
                  'Category',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text('Artificial Intelligence to help communicate with animals', style: TextStyle(fontSize: 20, color: Colors.black),),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Naved Gaoud  . March 9,2025', style: TextStyle(fontSize: 12, color: Colors.grey),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.share, color: Colors.grey, size: 16,))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}