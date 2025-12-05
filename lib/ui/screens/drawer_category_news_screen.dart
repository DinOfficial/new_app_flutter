import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the_daily_globe/ui/widgets/news_card.dart';

import '../../data/models/categories_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';
import '../widgets/show_snackbar_message.dart';

class DrawerCategoryNewsScreen extends StatefulWidget {
  const DrawerCategoryNewsScreen({super.key, required this.categoryName});

  final String categoryName;

  final String name = 'news-category-screen';

  @override
  State<DrawerCategoryNewsScreen> createState() => _DrawerCategoryNewsScreenState();
}

class _DrawerCategoryNewsScreenState extends State<DrawerCategoryNewsScreen> {
  List<CategoriesModel> _dataList = [];
  bool _isLoading = false;

  @override
  void initState() {
    _fetchCategoryAPI(widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryName), centerTitle: true),
      body: Visibility(
        visible: !_isLoading,
        replacement: Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          padding: EdgeInsets.all(12),
          itemCount: _dataList.length,
          itemBuilder: (context, index) {
            return NewsCard(news: _dataList[index]);
          },
        ),
      ),
    );
  }

  Future<void> _fetchCategoryAPI(String categoryName) async {
    _isLoading = true;
    setState(() {});
    final NetworkResponse response = await NetworkCaller().getRequest(
      Urls.urlsByCategory(categoryName),
    );

    if (response.isSuccess) {
      List<CategoriesModel> list = [];
      for (Map<String, dynamic> jsonData in response.body['response']) {
        list.add(CategoriesModel.fromJson(jsonData));
      }
      _dataList = list;
    } else {
      _isLoading = false;
      setState(() {});
      showCustomSnakbarMessage(context, response.errorMessage ?? 'Data Load Failed', true);
    }
    _isLoading = false;
    setState(() {});
  }
}
