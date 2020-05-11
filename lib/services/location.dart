import 'package:geolocator/geolocator.dart';

class Location {
  Location() {
    _geolocator = Geolocator()..forceAndroidLocationManager = true;
  }

  Geolocator _geolocator;
  Position _position;

  double get latitude => _position.latitude;
  double get longitude => _position.longitude;

  Future<void> getCurrentLocation() async {
    try {
      _position = await _geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
    } catch (e) {
      print(e);
    }
  }
}
