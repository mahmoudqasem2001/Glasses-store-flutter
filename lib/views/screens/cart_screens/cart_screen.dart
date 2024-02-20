import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubits/cart_cubit.dart';
import '../../widgets/cart_widgets/cart_item.dart';
import '../../widgets/cart_widgets/cart_order_button.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<CartCubit, List<CartItem>>(
        builder: (context, cart) {
          return cart.isEmpty
              ? const Center(
                  child: Text('Cart is empty'),
                )
              : Column(
                  children: [
                    Card(
                      margin: const EdgeInsets.all(15),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const Spacer(),
                            Chip(
                              label: Text(
                                '\$ ${cart.fold(0, (total, item) => total + (item.price ?? 0) * (item.quantity ?? 0))}',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .titleLarge
                                      ?.color,
                                ),
                              ),
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                            const OrderButton(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (ctx, index) {
                          return CartItem(
                            cart[index].id,
                            cart[index].productId,
                            cart[index].price,
                            cart[index].quantity,
                            cart[index].title,
                          );
                        },
                        itemCount: cart.length,
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
