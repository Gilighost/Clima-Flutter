import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  dynamic weatherData;

  @override
  void initState() {
    super.initState();

    getWeatherDataForCurrentLocation();
  }

  void getWeatherDataForCurrentLocation() async {
    Location location = Location();
    print('Getting current location.');
    await location.getCurrentLocation();
    print('Got current location.');

    await getWeatherData(
      latitude: location.latitude,
      longitude: location.longitude,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          weather: WeatherModel(weatherData),
        ),
      ),
    );
  }

  Future<void> getWeatherData({double latitude, double longitude}) async {
    NetworkHelper networkHelper = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=imperial&APPID=e5bb752d337aea8306adc3206b3a018b');

    print('Fetching weather...');
    weatherData = await networkHelper.getData();
    print('Got weather.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRing(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
