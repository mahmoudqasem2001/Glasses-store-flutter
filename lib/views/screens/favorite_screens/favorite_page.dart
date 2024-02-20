import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/views/screens/product_details_screens/product_detail_screen.dart';
import 'package:shop_app/cubits/favorites_cubit.dart';

class FavoritesPage extends StatelessWidget {
  static String routeName = '/favorite';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit(),
      child: FavoritesView(),
    );
  }
}

class FavoritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return BlocBuilder<FavoritesCubit, List<Product>>(
      builder: (context, state) {
        if (state.isEmpty) {
          return const Center(
            child: Text('No Favorite Products!'),
          );
        }

        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) {
            final product = state[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      ProductDetailScreen.routeName,
                      arguments: product,
                    ).then((value) {
                      context.read<FavoritesCubit>().removeFavorite(product);
                    });
                  },
                  leading: Image.network(
                    product.imageUrls![0],
                    height: 70,
                    width: 100,
                  ),
                  title: Text(
                    product.brand!.name!,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  subtitle: Text(
                    '\$${product.price}',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  trailing: orientation == Orientation.portrait
                      ? IconButton(
                          onPressed: () {
                            context.read<FavoritesCubit>().removeFavorite(product);
                          },
                          icon: const Icon(Icons.favorite),
                          color: Colors.red,
                        )
                      : TextButton.icon(
                          onPressed: () {
                            context.read<FavoritesCubit>().removeFavorite(product);
                          },
                          icon: const Icon(Icons.favorite),
                          label: const Text('Favorite'),
                        ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
