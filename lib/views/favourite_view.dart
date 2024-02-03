import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubits/favourite_cubit/favourite_cubit.dart';

import '../custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/favourite/favourite_list_view.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("My Favorites"),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          bottom: 24,
          top: 8,
        ),
        child: CustomButton(text: "Add All To Cart", onPressed: () {}),
      ),
      body: BlocProvider(
        create: (context) => FavouriteCubit(),
        child: const FavouriteListView(),
      ),
    );
  }
}
