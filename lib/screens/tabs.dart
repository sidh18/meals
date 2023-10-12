import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/main_drawer.dart';

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

  void _showInfoMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(message)));
  }

    if(isExisting){
      setState(() {
        _favouritemeals.remove(meal);
      });
      _showInfoMessage('Meal is no longer favourite');
      
    }else{
      setState(() {
         _favouritemeals.add(meal);
      });
      _showInfoMessage('Meal is added to favourite');
     
    }
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }

  void _setScreen(String identifier)async{
     Navigator.of(context).pop();
    if(identifier=='filters'){
     final result=await Navigator.of(context).push<Map<Filter,bool>>(MaterialPageRoute(builder:(ctx)=>const FiltersScreen() ),
      );

      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
      Widget activePage=CategoriesScreen(onToggleFavourite: _toggleMealFavouriteStatus,);
      var activePageTitle='Categories';

      if(_selectedPageIndex==1){
        activePage= MealsScreen(meals:_favouritemeals,onToggleFavourite: _toggleMealFavouriteStatus,);
        activePageTitle = 'Your Favourites';
      }

    return Scaffold(
      appBar:AppBar(
        title: Text(activePageTitle),
      ) ,
      drawer: MainDrawer(onSelectScreen: _setScreen,),
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