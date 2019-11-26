import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'unit.dart';

class Quotation extends StatefulWidget {


  final Color color;
  final List<Unit> units;

  const Quotation({
    @required this.color,
    @required this.units,
  }) : assert(color != null),
       assert(units != null);

  @override
  _QuotationState createState() => _QuotationState();
}

class _QuotationState extends State<Quotation> {
  
  @override
  Widget build(BuildContext context) {

    final unitWidgets = widget.units.map((Unit unit) {
      return Container(
        color: widget.color,
        margin: EdgeInsets.all(2.0),
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme.of(context).textTheme.subhead,
            ),
            Text(
              'Price: ${unit.price}'
            ),
          ],
        ),
      );
    }).toList();


    return ListView(
      children: unitWidgets,
    );
  } 
}