import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/models/meal.dart';

class TabsScreen extends StatefulWidget{
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreen();

  }

}

class _TabsScreen extends State<TabsScreen> {
  int _selectedPageIndex=0;
  final List<Meal>_favouritemeals=[];

  void _toggleMealFavouriteStatus(Meal meal){
    final isExisting=_favouritemeals.contains(meal);

    if(isExisting){
      _favouritemeals.remove(meal);
    }else{
      _favouritemeals.add(meal);
    }
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
      Widget activePage=CategoriesScreen(onToggleFavourite: _toggleMealFavouriteStatus,);
      var activePageTitle='Categories';

      if(_selectedPageIndex==1){
        activePage= MealsScreen(meals:[],onToggleFavourite: _toggleMealFavouriteStatus,);
        activePageTitle = 'Your Favourites';
      }

    return Scaffold(
      appBar:AppBar(
        title: Text(activePageTitle),
      ) ,
      body:activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap:_selectPage,
        currentIndex: _selectedPageIndex,
        items:const [
          BottomNavigationBarItem(icon:Icon(Icons.set_meal),label:'Categories'),
          BottomNavigationBarItem(icon:Icon(Icons.star),label:'Favourites'),
        ],
        
      ),

    );
  }

}