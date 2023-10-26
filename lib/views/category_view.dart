import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/models/category_model.dart';

import '../cubits/category_cubit/category_cubit.dart';
import '../widgets/category/category_card.dart';
import '../widgets/category/category_grid_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocProvider(
        create: (context) => CategoryCubit(),
        child: const CategoriesGridView(),
      ),
    );
  }
}
