import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubits/product_cubit/product_cubit.dart';
import 'package:grocery_app/models/product_model.dart';

import '../../constants.dart';
import '../custom_text.dart';
import 'product_list_view.dart';

class ExclusiveOfferWidget extends StatefulWidget {
  const ExclusiveOfferWidget({
    super.key,
  });

  @override
  State<ExclusiveOfferWidget> createState() => _ExclusiveOfferWidgetState();
}

class _ExclusiveOfferWidgetState extends State<ExclusiveOfferWidget> {
  dynamic exclusiveProducts;
  @override
  void initState() {
    exclusiveProducts = BlocProvider.of<ProductCubit>(context).getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return FutureBuilder(
            future: exclusiveProducts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Exclusive Offer",
                            theme: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          CustomText(
                            text: "See all",
                            theme: TextStyle(
                              color: kSecondaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    ProductsListView(
                      products: snapshot.data,
                    ),
                  ],
                );
              } else {
                return Text("OOPS THERE WAS AN ERROR");
              }
            });
      },
    );
  }
}
