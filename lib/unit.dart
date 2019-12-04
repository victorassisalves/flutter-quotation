import 'package:meta/meta.dart';

  class Unit {
  final String vehicleFactory;

  /// A [Unit] stores its name and conversion factor.
  ///
  /// An example would be 'Meter' and '1.0'.
  const Unit({
    @required this.vehicleFactory,
  })  : assert(vehicleFactory != null);

  /// Creates a [Unit] from a JSON object.
  Unit.fromJson(Map jsonMap)
      : assert(jsonMap['vehicleFactory'] != null),
        vehicleFactory = jsonMap['vehicleFactory'];
}