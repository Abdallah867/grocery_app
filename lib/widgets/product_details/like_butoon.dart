import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../cubits/cubit/favourite_cubit.dart';
import '../../cubits/cubit/favourite_state.dart';
import '../../helper/cache_helper.dart';
import '../../helper/service_locator.dart';

class LikeButton extends StatefulWidget {
  final String productId;

  const LikeButton({
    super.key,
    required this.productId,
  });

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late bool isProductLiked;

  @override
  void initState() {
    isProductLiked = BlocProvider.of<FavouriteCubit>(context)
        .checkIfProductIsFavourite(widget.productId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favouriteInfo = BlocProvider.of<FavouriteCubit>(context);
    final userId = getIt.get<CacheHelper>().getUserId();

    return BlocBuilder<FavouriteCubit, FavouriteState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () async {
            await updatingFavourite(
              isProductLiked,
              userId,
              widget.productId,
              favouriteInfo,
            );
            setState(() {
              isProductLiked = BlocProvider.of<FavouriteCubit>(context)
                  .checkIfProductIsFavourite(widget.productId);
            });
          },
          icon: isProductLiked
              ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              : const Icon(Icons.favorite_border_outlined),
          color: kGreyColor,
        );
      },
    );
  }
}

updatingFavourite(
  bool isProductLiked,
  String userId,
  String productId,
  var favouriteInfo,
) async {
  if (!isProductLiked) {
    await favouriteInfo.addItemtoFavouriteList(userId, productId);
  } else {
    await favouriteInfo.deleteItemFromFavouriteList(userId, productId);
  }
}
