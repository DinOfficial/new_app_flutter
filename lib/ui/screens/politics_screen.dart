import 'package:flutter/material.dart';
import 'package:the_daily_globe/data/models/categories_model.dart';
import 'package:the_daily_globe/data/services/network_caller.dart';
import 'package:the_daily_globe/data/utils/urls.dart';
import 'package:the_daily_globe/ui/widgets/show_snackbar_message.dart';

import '../widgets/news_card.dart';

class PoliticsScreen extends StatefulWidget {
  const PoliticsScreen({super.key});

  @override
  State<PoliticsScreen> createState() => _PoliticsScreenState();
}

class _PoliticsScreenState extends State<PoliticsScreen> {
  final String name = 'Politics';
  List<CategoriesModel> _dataList = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchCategoryAPI();
  }

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
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blueGrey),
              ),
              const SizedBox(height: 12),
              Visibility(
                visible: !_isLoading,
                replacement: Center(child: CircularProgressIndicator()),
                child: Expanded(
                  child: ListView.builder(
                    itemCount: _dataList.length,
                    itemBuilder: (context, index) {
                      return NewsCard(news: _dataList[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _fetchCategoryAPI() async {
    _isLoading = true;
    setState(() {});
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.urlsByCategory(name));

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
