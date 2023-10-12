import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/main.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {

  var _gluttenFreeFilterSet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: MainDrawer(onSelectScreen: (identifier){
        Navigator.of(context).pop();
        if(identifier=='meals'){
          Navigator.of(context).
          push(MaterialPageRoute(builder: (ctx)=>const TabsScreen()));
        }
      },),
      body: Column(
        children: [
          SwitchListTile(
            value:_gluttenFreeFilterSet,
            onChanged: (isChecked){
              setState(() {
                _gluttenFreeFilterSet = isChecked;
                
              });
            },
            title: Text(
              'Glutten-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'only include glutten-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
