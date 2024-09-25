import 'package:e_commerce/core/constants/assets.dart';
import 'package:e_commerce/modules/search_page/components/crid_item.dart';
import 'package:flutter/material.dart';

class JobCategoriesGrid extends StatelessWidget {
  final List<Map<String, String>> jobCategories = [
    {'name': 'interior design', 'image': AssetsImages.interior_design},
    {'name': 'Traditional art', 'image': AssetsImages.traditional},
    {'name': '3D Animation', 'image': AssetsImages.animation_3d},
    {'name': 'Marketing', 'image': AssetsImages.marketing},
    {'name': 'web Programming','image': AssetsImages.web_developer},
    {'name': 'Calligraphy&lettering', 'image': AssetsImages.calligraphy},
    {'name': 'UX Design', 'image': AssetsImages.ux_design},
    {'name': 'Photography', 'image': AssetsImages.photoshop},
    // Add more categories here
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        itemCount: jobCategories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return JobCategoryItem(
            jobName: jobCategories[index]['name']!,
            imagePath: jobCategories[index]['image']!,
          );
        },
      ),
    );
  }
}
