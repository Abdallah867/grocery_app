import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/custom_app_bar.dart';
import '../widgets/category/category_grid_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Find Products"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 12.0.h),
        child: const CategoriesGridView(),
      ),
    );
  }
}
