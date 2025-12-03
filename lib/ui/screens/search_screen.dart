// C:/tools/the_daily_globe/lib/ui/screens/search_screen.dart

import 'package:flutter/material.dart';

import '../widgets/pupular_text_button.dart';
import '../widgets/search_news_card.dart';
import '../widgets/section_title.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  final String name = 'search-page';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search_sharp),
                    filled: true,
                    hintText: 'Search by keywords',
                    hintStyle: TextStyle(color: Colors.black38),
                  ),
                ),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 12),
                SectionTitle(title: 'Popular Search'),
                const SizedBox(height: 12),
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 12,
                  runSpacing: 8,
                  children: [
                    PopularTextButton(text: 'Ukraine',),
                    PopularTextButton(text: 'Supreme Court',),
                    PopularTextButton(text: 'China',),
                    PopularTextButton(text: 'Inflation',),
                    PopularTextButton(text: 'Popular Articles',),
                    PopularTextButton(text: 'Inflation',),
                  ],
                ),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 12),
                SectionTitle(title: 'Popular Articles'),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
        // ListView.builder
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          sliver: SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return SearchNewsCard();
            },
          ),
        ),
      ],
    );
  }
}




