import 'package:flutter/material.dart';
import 'package:grocery_app/custom_app_bar.dart';
import '../widgets/category/category_grid_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Find Products"),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: CategoriesGridView(),
      ),
    );
  }
}
