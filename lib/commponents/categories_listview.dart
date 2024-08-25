import 'package:flutter/material.dart';
import 'package:news_app/commponents/category_card.dart';
import 'package:news_app/models/categorymodels.dart';

class CategoriesListview extends StatelessWidget {
  const CategoriesListview({super.key});
  final List<CategoryModel> categoriesList = const [
    CategoryModel(
      imageAssetUrl: 'assets/business.avif',
      categoryName: 'business',
    ),
    CategoryModel(
      imageAssetUrl: 'assets/entertaiment.avif',
      categoryName: 'entertainment',
    ),
    CategoryModel(
      imageAssetUrl: 'assets/general.avif',
      categoryName: 'general',
    ),
    CategoryModel(
      imageAssetUrl: 'assets/health.avif',
      categoryName: 'health',
    ),
    CategoryModel(
      imageAssetUrl: 'assets/science.avif',
      categoryName: 'science',
    ),
    CategoryModel(
      imageAssetUrl: 'assets/sports.avif',
      categoryName: 'sports',
    ),
    CategoryModel(
      imageAssetUrl: 'assets/technology.jpeg',
      categoryName: 'technology',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categoriesList.length,
        itemBuilder: (context, index) => CategoryCard(
          category: categoriesList[index],
        ),
      ),
    );
  }
}
