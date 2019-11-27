import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'category.dart';
import 'category_route.dart';

Color _onsuranceColor = Color(0xFF02B7FF);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: CategoryRoute()
      home: MyStateFulWidget(),

    ),
  );
}

class MyStateFulWidget extends StatefulWidget {

  @override
  _MyStateFulWidgetState createState() => _MyStateFulWidgetState();
}
String btn = "Meu Botão";
bool ligado = false;
class _MyStateFulWidgetState extends State<MyStateFulWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Onsurance Quotation",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: _onsuranceColor,
      ),
      body: Container(
        color: Colors.black87,
        child: Center(
          
          child: Column(
            children: <Widget>[
              
              Center(
                child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 15.0, right: 5.0, bottom: 15.0),
                    child: Icon(
                      Icons.directions_car,
                      color: Colors.white,
                    ),
                  
                  ),
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Text(
                      "Onsurance Auto", 
                      style: TextStyle(color: Colors.white), 
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 45.0, top: 10.0),
                    child: Transform.scale(
                      scale: 3.0,
                      child: Switch(
                        activeColor: Colors.blue,
                        value: ligado,
                        activeTrackColor: Colors.green,
                        inactiveTrackColor: Colors.red[200],

                        dragStartBehavior: DragStartBehavior.start,
                        onChanged: (bool newValue) {
                          setState(() {
                            ligado = newValue;
                          });
                        },
                        activeThumbImage: ExactAssetImage('img/Webp.net-resizeimage.png', scale: 1.0),
                        inactiveThumbImage: ExactAssetImage('img/botaoOff.webp', scale: 3.0),
                      ),
                    ),
                  ),
                  ],
              ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 20.0,
          child: Center(child: Text("Meu Texto"),),
        ),
      ),
    );
  }
}
