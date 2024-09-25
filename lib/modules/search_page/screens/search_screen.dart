import 'package:e_commerce/modules/search_page/components/search_bar.dart';
import 'package:flutter/material.dart';

import '../components/job_categories.dart';
import '../components/top_search.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchBarfield(),
          TopSearchList(),
          Expanded(child: JobCategoriesGrid()),
        ],
      ),
    );
  }
}