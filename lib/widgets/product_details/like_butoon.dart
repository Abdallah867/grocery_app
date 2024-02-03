import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../cubits/favourite_cubit/favourite_cubit.dart';
import '../../cubits/favourite_cubit/favourite_state.dart';
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
  dynamic future;

  @override
  void initState() {
    if (getIt.get<CacheHelper>().isKeyExists(kFavouriteList)) {
      isProductLiked = BlocProvider.of<FavouriteCubit>(context)
          .checkIfProductIsFavourite(widget.productId);
      future = null;
    } else {
      getIt.get<CacheHelper>().storeString(kFavouriteList, '[]');
      future = BlocProvider.of<FavouriteCubit>(context).storeFavouriteInCache();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favouriteInfo = BlocProvider.of<FavouriteCubit>(context);
    final userId = getIt.get<CacheHelper>().getUserId();

    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          isProductLiked = BlocProvider.of<FavouriteCubit>(context)
              .checkIfProductIsFavourite(widget.productId);

          return BlocBuilder<FavouriteCubit, FavouriteState>(
            builder: (context, state) {
              return AbsorbPointer(
                absorbing: state is FavouriteLoading,
                child: IconButton(
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
                ),
              );
            },
          );
        });
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
