import 'package:geolocator/geolocator.dart';

class Location {
  Position _position;

  double get latitude => _position.latitude;
  double get longitude => _position.longitude;

  Future<void> getCurrentLocation() async {
    try {
      _position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    } catch (e) {
      print(e);
    }
  }
}
