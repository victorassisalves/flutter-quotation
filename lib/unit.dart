import 'package:meta/meta.dart';

class Unit {
  final String name;
  final double price;

  const Unit ({
    @required this.name,
    @required this.price
  }) : assert(name != null),
       assert(price != null);

       /// Creates a [Unit] from a JSON object.
  Unit.fromJson(Map jsonMap)
      : assert(jsonMap['name'] != null),
        assert(jsonMap['price'] != null),
        name = jsonMap['name'],
        price = jsonMap['price'].toDouble();
}