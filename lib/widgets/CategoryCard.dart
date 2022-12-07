import 'package:flutter/material.dart';
import 'package:trilicious_mvp/constants/app_text.dart';

import '../constants/app_large_text.dart';

class CategoryCard extends StatelessWidget {
   const CategoryCard ({super.key, required this.categoryImage, required this.categoryName }) ;

  final String categoryImage;
  final String categoryName;


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset( categoryImage,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover),
              )
          ),
          AppLargeText(text: categoryName,
          size: 12,
          )
        ],
      ),
    );
  }
}