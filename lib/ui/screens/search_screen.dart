import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  final String name = 'search-page';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search_sharp),
                filled: true,
                // fillColor: Colors.grey.shade200,
                hintText: 'Search by keywords',
                hintStyle: TextStyle(color: Colors.black38),
                focusColor: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 12),
            Divider(),
            const SizedBox(height: 12),
            const Text('Popular Search', style: TextStyle(fontSize: 16, color: Colors.redAccent, fontWeight: FontWeight.bold),),
            const SizedBox(height: 12,),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 20,
              runSpacing: 4,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.black26),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Ukrain'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.black26),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Suprem Court'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.black26),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('China'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.black26),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Inflaction'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.black26),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Oil Price'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.black26),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Plan Crash'),
                ),
              ],
            ),
            const SizedBox(height: 12,),
            Divider(),
            const SizedBox(height: 12,),
            const Text('Popular Articles', style: TextStyle(fontSize: 16, color: Colors.redAccent, fontWeight: FontWeight.bold),),
            const SizedBox(height: 12,),
          ],
        ),
      ),
    );
  }
}
