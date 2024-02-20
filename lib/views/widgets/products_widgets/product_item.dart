import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/dummy_data.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/shared/assets_images/assets_images.dart';
import 'package:shop_app/views/screens/product_details_screens/product_detail_screen.dart';

import '../../../cubits/favorites_cubit.dart';

class ProductItem extends StatelessWidget {
  final int index;
  ProductItem(this.index, {Key? key});

  @override
  Widget build(BuildContext context) {
    final Product currentProduct = DummyData.getDummyProducts()[index];
    final FavoritesCubit favoriteProductsCubit = BlocProvider.of<FavoritesCubit>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 1.2,
          ),
          color: Colors.white,
        ),
        child: GridTile(
          footer: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      currentProduct.brand?.name ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '\$ ${currentProduct.price.toString()}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: currentProduct.id);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 4,
                  right: 4,
                  child: InkWell(
                    onTap: () {
                      favoriteProductsCubit.toggleFavorite(currentProduct);
                    },
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          favoriteProductsCubit.state.contains(currentProduct) ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
                Hero(
                  tag: currentProduct.id ?? '',
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FadeInImage(
                      placeholder: AssetImage(AssetsImages.glassesPlaceHolder),
                      image: NetworkImage(currentProduct.imageUrls?.first ?? ''),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
