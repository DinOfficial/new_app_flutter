import 'package:flutter/material.dart';
import 'package:the_daily_globe/ui/widgets/section_title.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({super.key});

  final String name = 'news-details';

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          Image.network(
            'https://library.ceu.edu/wp-content/uploads/news-2444778_960_720.jpg',
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 12),
          SectionTitle(title: 'Category'),
          const SizedBox(height: 12),
          Text(
            'Scientists criticize food manufacturers for massive profits from sales of unhealthy ultraprocessed food',
            style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            'Author: kims uiliams \n'
            'Publish Date: Jan 9, 2025\n'
            'Source: CNN',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
          Text(
            'Ultraprocessed foods are causing a global decline in health yet food manufacturers continue to value profit over public health, a global coalition of scientists say.',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            //TODO: p1-p5
            'Certain ultraprocessed foods , or UPFs, are contributing to worldwide obesity, chronic health conditions and premature death , yet the food industry continues to aggressively market new and existing products in this category for massive profits, according to an unprecedented three-part series authored by 43 global experts in nutrition and supported by the United Nations Children’s Fund, or UNICEF, and the World Health Organization.\n'
            'More than 50% of the \$2.9 trillion paid to shareholders by food corporations between 1962 and 2021 “was distributed by UPF manufacturers alone,” according to research published Tuesday in the leading medical journal The Lancet.\n'
            'We found evidence that UPF consumption is increasing everywhere arou',
            style: TextStyle(fontSize: 16),
          ),
          // TODO: Second Banner
          const SizedBox(height: 12),
          Image.network(
            'https://library.ceu.edu/wp-content/uploads/news-2444778_960_720.jpg',
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 12),
          Text(
            // TODO: p7-p11
            'Certain ultraprocessed foods , or UPFs, are contributing to worldwide obesity, chronic health conditions and premature death , yet the food industry continues to aggressively market new and existing products in this category for massive profits, according to an unprecedented three-part series authored by 43 global experts in nutrition and supported by the United Nations Children’s Fund, or UNICEF, and the World Health Organization.\n'
            'More than 50% of the \$2.9 trillion paid to shareholders by food corporations between 1962 and 2021 “was distributed by UPF manufacturers alone,” according to research published Tuesday in the leading medical journal The Lancet.\n'
            'We found evidence that UPF consumption is increasing everywhere arou',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 12),
          // TODO: Headline 2
          Text(
            'Ultraprocessed foods are causing a global decline in health yet food manufacturers continue to value profit over public health, a global coalition of scientists say.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            // TODO: p13-p16
            'Certain ultraprocessed foods , or UPFs, are contributing to worldwide obesity, chronic health conditions and premature death , yet the food industry continues to aggressively market new and existing products in this category for massive profits, according to an unprecedented three-part series authored by 43 global experts in nutrition and supported by the United Nations Children’s Fund, or UNICEF, and the World Health Organization.\n'
            'More than 50% of the \$2.9 trillion paid to shareholders by food corporations between 1962 and 2021 “was distributed by UPF manufacturers alone,” according to research published Tuesday in the leading medical journal The Lancet.\n'
            'We found evidence that UPF consumption is increasing everywhere arou',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 12),
          // TODO: Headline 3
          Text(
            'Ultraprocessed foods are causing a global decline in health yet food manufacturers continue to value profit over public health, a global coalition of scientists say.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            // TODO: p18-p31
            'Certain ultraprocessed foods , or UPFs, are contributing to worldwide obesity, chronic health conditions and premature death , yet the food industry continues to aggressively market new and existing products in this category for massive profits, according to an unprecedented three-part series authored by 43 global experts in nutrition and supported by the United Nations Children’s Fund, or UNICEF, and the World Health Organization.\n'
            'More than 50% of the \$2.9 trillion paid to shareholders by food corporations between 1962 and 2021 “was distributed by UPF manufacturers alone,” according to research published Tuesday in the leading medical journal The Lancet.\n'
            'We found evidence that UPF consumption is increasing everywhere arou',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 12),
          // TODO: Headline 4
          Text(
            'Ultra processed foods are causing a global decline in health yet food manufacturers continue to value profit over public health, a global coalition of scientists say.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            // TODO: p33-p46
            'Certain ultra processed foods , or UPFs, are contributing to worldwide obesity, chronic health conditions and premature death , yet the food industry continues to aggressively market new and existing products in this category for massive profits, according to an unprecedented three-part series authored by 43 global experts in nutrition and supported by the United Nations Children’s Fund, or UNICEF, and the World Health Organization.\n'
            'More than 50% of the \$2.9 trillion paid to shareholders by food corporations between 1962 and 2021 “was distributed by UPF manufacturers alone,” according to research published Tuesday in the leading medical journal The Lancet.\n'
            'We found evidence that UPF consumption is increasing everywhere around',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 12),
          // TODO: Third Banner
          const SizedBox(height: 12),
          Image.network(
            'https://library.ceu.edu/wp-content/uploads/news-2444778_960_720.jpg',
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: () {},
            child: Text(
              'Source: https://edition.cnn.com/2025/06/09/health/state-gun-laws-pediatric-deaths ',
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
