import 'package:flutter/material.dart';
import '../widgets/category/category_grid_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: CategoriesGridView(),
    );
  }
}
