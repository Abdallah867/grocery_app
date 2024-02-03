import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/constants.dart';
import 'package:grocery_app/cubits/favourite_cubit/favourite_cubit.dart';
import 'package:grocery_app/cubits/favourite_cubit/favourite_state.dart';
import 'package:grocery_app/helper/cache_helper.dart';
import 'package:grocery_app/helper/service_locator.dart';

import '../../loading_widget.dart';
import '../../models/product_model.dart';
import 'favourite_item.dart';

class FavouriteListView extends StatefulWidget {
  const FavouriteListView({super.key});

  @override
  State<FavouriteListView> createState() => _FavouriteListViewState();
}

class _FavouriteListViewState extends State<FavouriteListView> {
  @override
  void initState() {
    if (getIt.get<CacheHelper>().isKeyExists(kFavouriteList)) {
      List productsIds =
          jsonDecode(getIt.get<CacheHelper>().getString(kFavouriteList));
      print(productsIds);
      BlocProvider.of<FavouriteCubit>(context)
          .getFavouriteProducts(productsIds);
    } else {
      BlocProvider.of<FavouriteCubit>(context).storeFavouriteInCache();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCubit, FavouriteState>(
      listener: (context, state) {
        if (state is FavouriteStored) {
          List productsIds =
              jsonDecode(getIt.get<CacheHelper>().getString(kFavouriteList));
          BlocProvider.of<FavouriteCubit>(context)
              .getFavouriteProducts(productsIds);
        }
      },
      builder: (context, state) {
        if (state is FavouriteLoading) {
          return const LoadingWidget();
        }
        if (state is FavouriteRetrieved) {
          List<ProductModel> favouriteProducts = state.products;

          return ListView.separated(
            separatorBuilder: (context, numb) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),
            itemBuilder: (context, index) => FavouriteItem(
              product: favouriteProducts[index],
            ),
            itemCount: favouriteProducts.length,
          );
        } else
          return Text("OOPS THERE WAS AN ERROR");
      },
    );
  }
}
