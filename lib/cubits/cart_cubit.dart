import 'package:bloc/bloc.dart';

import '../models/cart_item.dart';


class CartCubit extends Cubit<List<CartItem>> {
  CartCubit() : super([]);

  void addItem(CartItem item) {
    final updatedList = List<CartItem>.from(state)..add(item);
    emit(updatedList);
  }

  void removeItem(int productId) {
    final updatedList = List<CartItem>.from(state)..removeWhere((item) => item.id == productId.toString());
    emit(updatedList);
  }

  void clearCart() {
    emit([]);
  }
}
