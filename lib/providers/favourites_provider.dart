import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavouriteMealsNotifier():super([]);

  void _toggleMealFavouriteStatus(Meal meal){
    final mealIsFavourite=state.contains(meal);

    if(mealIsFavourite){
      state=state.where((m)=>m.id!=meal.id).toList();
    }else{
      state=[...state,meal];
    }
  }
}

final favouriteMealsProvider= 
StateNotifierProvider<FavouriteMealsNotifier,List<Meal>>((ref){
  return FavouriteMealsNotifier();
});