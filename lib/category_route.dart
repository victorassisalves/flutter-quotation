import 'package:flutter/material.dart';
import 'package:flutter_rectangle/category.dart';
import 'unit.dart';

final _backgroundColor = Colors.lightBlue[300];

class CategoryRoute extends StatefulWidget {
  const CategoryRoute();

  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  
  final categories = <Category>[];
  
  static const _categoryNames = <String> [
    'Carro',
    'Moto',
    'VUCs',
    'Pneus',
    'Caminhonete',
    'Celular',
  ];

   static const _baseColors = <Color>[
    Colors.cyanAccent,
    Colors.teal,
    Colors.blueGrey,
    Colors.blueAccent,
    Colors.indigoAccent,
    Colors.indigo,
  ];

  static const _icons = <IconData> [
    Icons.directions_car,
    Icons.motorcycle,
    Icons.airport_shuttle,
    Icons.trip_origin,
    Icons.directions_transit,
    Icons.phonelink_lock,
  ];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _categoryNames.length ; i++) {
      categories.add(
        Category(
          name: _categoryNames[i],
          color: _baseColors[i],
          iconLocation: _icons[i],
          units: _retrieveUnitsList(_categoryNames[i])
        )
      );
    }
  }


  Widget _buildCategoryItems(List<Widget> categories) {
    return ListView.builder(
            itemBuilder: (BuildContext contentext, int index) => categories[index],
            itemCount: categories.length,
    );
  }


  List<Unit>_retrieveUnitsList(String categoryName) {
    return List.generate(9, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        price: i.toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    final listView = Container(

      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryItems(categories),
    );
    final appBar = AppBar(
      title: Text(
        "Cotação Onsurance",
        style: TextStyle(
          color: Colors.black87,
          fontSize: 25.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: _backgroundColor,
    );


    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}