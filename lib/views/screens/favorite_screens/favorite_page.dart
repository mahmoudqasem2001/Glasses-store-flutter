import 'package:flutter/material.dart';
import 'package:shop_app/models/dummy_data.dart';
import 'package:shop_app/views/screens/product_details_screens/product_detail_screen.dart';

class FavoritesPage extends StatefulWidget {
  static String routeName = '/favorite';
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    debugPrint('FavoritesPage build()');

    if (DummyData.favProducts.isEmpty) {
      return const Center(
        child: Text('No Favorite Products!'),
      );
    }

    return ListView.builder(
        itemCount: DummyData.favProducts.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(
                        ProductDetailScreen.routeName,
                        arguments: DummyData.favProducts[index],
                      )
                      .then((value) => setState(() {}));
                },
                leading: Image.network(
                  DummyData.favProducts[index].imageUrls![0],
                  height: 70,
                  width: 100,
                  
                ),
                title: Text(
                  DummyData.favProducts[index].brand!.name!,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                subtitle: Text(
                  '${DummyData.favProducts[index].price} - \$${DummyData.favProducts[index].price}',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                ),
                trailing: orientation == Orientation.portrait
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            DummyData.favProducts.remove(DummyData.favProducts[index]);
                          });
                        },
                        icon: const Icon(Icons.favorite),
                        color: Colors.red,
                      )
                    : TextButton.icon(
                        onPressed: () {
                          setState(() {
                            DummyData.favProducts.remove(DummyData.favProducts[index]);
                          });
                        },
                        icon: const Icon(Icons.favorite),
                        label: const Text('Favorite'),
                      ),
              ),
            ),
          );
        });
  }
}
