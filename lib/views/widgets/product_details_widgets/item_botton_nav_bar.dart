import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../cubits/cart_cubit.dart';
import '../../../models/cart_item.dart';
import '../../../providers/auth.dart';
import '../../../providers/products_provider.dart';

class ItemBottomNavBar extends StatelessWidget {
  const ItemBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments!;
    final loadedProduct = Provider.of<Products>(context, listen: false)
        .findById(productId as int);
    var productsProvider = Provider.of<Products>(context, listen: false);
    return BottomAppBar(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                width: 5,
                color: Theme.of(context).colorScheme.secondary,
                child: TextButton(
                  onPressed: () {},
                  child: Column(
                    children: [
                      Text(
                        'TRY WITH AR',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                width: 5,
                color: Theme.of(context).colorScheme.primary,
                child: TextButton(
                  onPressed: () {
                    if (productsProvider.productQuantity == 0) {
                      return;
                    }
                    final authProvider =
                        Provider.of<Auth>(context, listen: false);
                    authProvider
                        .fetchCustomerAccountInfo()
                        .then((value) => authProvider.setAuthentucated(value));
                    final cartCubit = context.read<CartCubit>();
                    cartCubit.addItem(CartItem(
                      id: loadedProduct.id.toString(),
                      productId: loadedProduct.id!,
                      price: loadedProduct.price,
                      quantity: productsProvider.productQuantity,
                      title: loadedProduct.brand!.name,
                    ));
                    productsProvider.setProductQuantity(0);
                  },
                  child: Column(
                    children: [
                      Text(
                        'Add To Cart',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
