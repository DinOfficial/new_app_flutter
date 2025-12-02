import 'package:flutter/material.dart';

import '../widgets/news_card.dart';

class PoliticsScreen extends StatefulWidget {
  const PoliticsScreen({super.key});

  @override
  State<PoliticsScreen> createState() => _PoliticsScreenState();
}

class _PoliticsScreenState extends State<PoliticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Breaking News',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blueGrey),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return NewsCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
