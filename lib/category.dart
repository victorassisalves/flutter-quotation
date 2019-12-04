
import "package:flutter/material.dart";
import 'package:flutter_rectangle/quotation_route.dart';
import 'package:meta/meta.dart';
import 'unit.dart';
import 'quotation_route.dart';


const _rowHeight = 100.0;
/// A custom [Category] widget.
///
/// The widget is composed on an [Icon] and [Text]. Tapping on the widget shows
/// a colored [InkWell] animation.
class Category extends StatelessWidget {

  final String name;
  final ColorSwatch color;
  final IconData iconLocation;
  final List<Unit> units;


  const Category({
    Key key,
    @required this.name,
    @required this.color,
    @required this.iconLocation,
    @required this.units,
  }) : assert(name != null),
       assert(color != null),
       assert(iconLocation != null),
       assert(units != null),
       super(key: key);

  void _navigateToQuotation(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              elevation: 1.0,
              title: Text(
                name,
                style: Theme.of(context).textTheme.display1,
              ),
              centerTitle: true,
              backgroundColor: color,
            ),
            body: Quotation(
              color: color,
              units: units,
            ),
            resizeToAvoidBottomPadding: false, // This avoid resizing the screen when keypad appears
          );
        },
      ));
  }

  
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)),
        ),
        height: _rowHeight,
        child: InkWell(
          borderRadius: BorderRadius.circular(_rowHeight/3.5),
          highlightColor: color[200],
          splashColor: color[100],
          onTap: () => _navigateToQuotation(context),
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    iconLocation,
                    size: 40.0
                  ),
                ),
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
