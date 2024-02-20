// ignore_for_file: unused_import
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/auth.dart';
import 'package:shop_app/shared/constants/constants.dart';
import 'package:shop_app/views/screens/favorite_screens/favorite_page.dart';
import 'package:shop_app/views/widgets/drawer/end_drawer/end_drawer.dart';
import '../../widgets/drawer/app_drawer/app_drawer.dart';
import '../../widgets/cart_widgets/badge.dart' as my_badge;
import '../../../providers/cart_provider.dart';
import '../../../providers/products_provider.dart';
import '../../widgets/home_widgets/home_bottom_bar.dart';
import '../cart_screens/cart_screen.dart';
import '../profile_screens/profile_screen.dart';
import 'product_overview_screen.dart';

enum FilterOption { favorites, all }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _suggestions = ['brada', 'HM', 'Luis Veton'];
  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<Auth>(context, listen: false);
    final cartProvider = Provider.of<Cart>(context, listen: false);
    final productsProvider = Provider.of<Products>(context, listen: false);

    productsProvider.fetchAndSetProducts();
    if (userType == "customer") {
      authProvider.fetchCustomerAccountInfo().then((value) {
        authProvider.setAuthentucated(value);
        if (authProvider.authenticated == true) {
          cartProvider.fetchCartItems();
        }
      });
    } else if (userType == "store") {
      authProvider.fetchStoreAccountInfo().then((value) {
        authProvider.setAuthentucated(value);
        if (authProvider.authenticated == true) {
          cartProvider.fetchCartItems();
        }
      });
    }
  }

  Future<List<String>> _fetchSuggestions(String searchValue) async {
    await Future.delayed(const Duration(milliseconds: 750));

    return _suggestions.where((element) {
      return element.toLowerCase().contains(searchValue.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List screens = [
      const ProductOverViewScreen(),
      FavoritesPage(),
      CartScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: EasySearchBar(
          searchBackgroundColor: Colors.white,
          suggestionBackgroundColor: Colors.white,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('EYEWEAR'),
            ],
          ),
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          onSearch: (value) => Provider.of<Products>(context, listen: false)
              .filterProductsByBrandName(value),
          asyncSuggestions: (value) async => await _fetchSuggestions(value)),
      body: Consumer<Products>(
        builder: (context, products, child) {
          return screens[products.bottomBarSelectedIndex];
        },
      ),
      drawer: const AppDrawer(),
      endDrawerEnableOpenDragGesture: false,
      endDrawer: EndDrawer(),
      bottomNavigationBar: const HomeBottomBar(),
    );
  }
}
