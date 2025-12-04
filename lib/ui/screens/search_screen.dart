// C:/tools/the_daily_globe/lib/ui/screens/search_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:the_daily_globe/data/models/categories_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';
import '../widgets/pupular_text_button.dart';
import '../widgets/search_news_card.dart';
import '../widgets/section_title.dart';
import '../widgets/show_snackbar_message.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _isLoading = false;
  final TextEditingController _searchController = TextEditingController();
  List<CategoriesModel> _searchNewsList = [];
  Timer? _debounce;

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 600), () {
      if (query.isNotEmpty) {
        _searchNews(query);
      } else {
        setState(() {
          _searchNewsList.clear();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search_sharp),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              _onSearchChanged('');
                            },
                          )
                        : null,
                    filled: true,
                    hintText: 'Search by keywords',
                    hintStyle: const TextStyle(color: Colors.black38),
                  ),
                ),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 12),
                SectionTitle(title: 'Popular Search'),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: [
                    PopularTextButton(text: 'Ukraine', onTap: () => _onSearchChanged('Ukraine')),
                    PopularTextButton(text: 'AI', onTap: () => _onSearchChanged('AI')),
                    PopularTextButton(text: 'Gaza', onTap: () => _onSearchChanged('Gaza')),
                    PopularTextButton(
                      text: 'Inflation',
                      onTap: () => _onSearchChanged('Inflation'),
                    ),
                    PopularTextButton(
                      text: 'Bangladesh',
                      onTap: () => _onSearchChanged('Bangladesh'),
                    ),
                    PopularTextButton(
                      text: 'Russia',
                      onTap: () => _onSearchChanged('Russia'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Divider(),
                if (_searchController.text.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: SectionTitle(title: 'Search Results'),
                  ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
        if (_isLoading)
          const SliverFillRemaining(child: Center(child: CircularProgressIndicator()))
        else if (_searchNewsList.isNotEmpty)
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            sliver: SliverList.builder(
              itemCount: _searchNewsList.length,
              itemBuilder: (context, index) {
                final newsItem = _searchNewsList[index];
                return SearchNewsCard(news: newsItem);
              },
            ),
          )
        else if (_searchController.text.isNotEmpty && _searchNewsList.isEmpty)
          SliverFillRemaining(
            child: Center(
              child: Image.network(
                'https://img.freepik.com/free-vector/flat-design-no-data-illustration_23-2150527142.jpg?w=740',
                width: 250,
              ),
            ),
          ),
      ],
    );
  }

  Future<void> _searchNews(String query) async {
    setState(() {
      _isLoading = true;
    });

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.serchNewsUrl(query));
    if (response.isSuccess && response.body['response'] != null) {
      final responseData = response.body['response'];
      if (responseData is List) {
        _searchNewsList = responseData.map((json) => CategoriesModel.fromJson(json)).toList();
      } else {
        _searchNewsList.clear();
      }
    } else {
      _searchNewsList.clear();
      if (mounted) {
        showCustomSnakbarMessage(context, response.errorMessage ?? 'Data Load Failed', true);
      }
    }

    setState(() {
      _isLoading = false;
    });
  }
}
