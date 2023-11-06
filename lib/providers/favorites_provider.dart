import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoritesNotifier extends StateNotifier<List<Meal>>{
  FavoritesNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal){
    final mealIsFavorite = state.contains(meal);
    if(mealIsFavorite){
      state = state.where((element) => element.id != meal.id,).toList();
      return false;
    }else{
      state = [... state, meal];
      return true;
    }
  }
}

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, List<Meal>>((ref) {return FavoritesNotifier();});