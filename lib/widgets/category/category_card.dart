import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      child: Container(
        width: 174.5.w,
        height: 189.11.h,
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
              height: 100.9.h,
              width: 111.38.w,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(maxWidth: 101.w),
              child: CustomText(
                  text: category.categoryName,
                  theme: styleText(
                    fontSize: 16.sp,
                    fontweight: FontWeight.w900,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
