import 'package:bloc/bloc.dart';
import 'package:shop_app/models/product.dart';

class FavoritesCubit extends Cubit<List<Product>> {
  FavoritesCubit() : super([]);

   void addFavorite(Product product) {
    final updatedList = List<Product>.from(state)..add(product);
    emit(updatedList);
  }

  void removeFavorite(Product product) {
    final updatedList = List<Product>.from(state)..remove(product);
    emit(updatedList);
  }

   void toggleFavorite(Product product) {
    final List<Product> currentFavorites = List.from(state);
    if (currentFavorites.contains(product)) {
      currentFavorites.remove(product);
    } else {
      currentFavorites.add(product);
    }
    emit(currentFavorites);
  }
}
