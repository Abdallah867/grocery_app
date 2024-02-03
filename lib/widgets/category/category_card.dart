import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/models/category_model.dart';
import 'package:grocery_app/views/products_list_view.dart';
import 'package:grocery_app/widgets/custom_text.dart';

import '../../cubits/category_products_cubit/category_products_cubit.dart';
import '../../helper/text_style_method.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => CategoryProductsCubit(),
                    child: ProductsListView(
                      categoryName: category.categoryName,
                    ),
                  )),
        );
      },
      child:  Container(
        width: 174.5,
        height: 189.11,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: const Color(0xFF53B175).withOpacity(0.7),
          ),
          color: const Color(0xFF53B175).withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(18)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              category.imageUrl,
              height: 74.9,
              width: 111.38,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              constraints: const BoxConstraints(maxWidth: 101),
              child: CustomText(
                  text: category.categoryName,
                  theme: styleText(
                    fontSize: 16,
                    fontweight: FontWeight.w900,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
