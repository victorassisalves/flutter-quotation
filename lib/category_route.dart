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
  static const brandColors = <ColorSwatch>[
    ColorSwatch(0xFF02b7ff, {
      "input": Color(0xFF02b799) 
    })
  ];
  
  static const _categoryNames = <String> [
    'Carro',
    'Moto',
    'VUCs',
    'Pneus',
    'Caminhonete',
  ];

   static const _baseColors = <ColorSwatch>[
    ColorSwatch(0xFF6AB7A8, {
      'highlight': Color(0xFF6AB7A8),
      'splash': Color(0xFF0ABC9B),
    }),
    ColorSwatch(0xFFFFD28E, {
      'highlight': Color(0xFFFFD28E),
      'splash': Color(0xFFFFA41C),
    }),
    ColorSwatch(0xFFFFB7DE, {
      'highlight': Color(0xFFFFB7DE),
      'splash': Color(0xFFF94CBF),
    }),
    ColorSwatch(0xFF8899A8, {
      'highlight': Color(0xFF8899A8),
      'splash': Color(0xFFA9CAE8),
    }),
    ColorSwatch(0xFFEAD37E, {
      'highlight': Color(0xFFEAD37E),
      'splash': Color(0xFFFFE070),
    }),
  ];

  static const _icons = <IconData> [
    Icons.directions_car,
    Icons.motorcycle,
    Icons.airport_shuttle,
    Icons.trip_origin,
    Icons.directions_transit,
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
    String vehicleFactory = 'nacional';
    return List.generate(2, (int i) {
      if (i == 1) {
        vehicleFactory = 'importado';
      }
      i += 1;

      return Unit(
        vehicleFactory: vehicleFactory
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