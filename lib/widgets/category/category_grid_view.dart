import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubits/category_cubit/category_cubit.dart';
import '../../models/category_model.dart';
import 'category_card.dart';

class CategoriesGridView extends StatefulWidget {
  const CategoriesGridView({
    super.key,
  });

  @override
  State<CategoriesGridView> createState() => _CategoriesGridViewState();
}

class _CategoriesGridViewState extends State<CategoriesGridView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories =
        BlocProvider.of<CategoryCubit>(context).categoriesList;

    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              mainAxisExtent: 175.w,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return CategoryCard(
                category: categories[index],
              );
            });
      },
    );
  }
}
