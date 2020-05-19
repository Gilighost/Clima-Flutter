import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    getWeatherDataForCurrentLocation();
  }

  void getWeatherDataForCurrentLocation() async {
    final weatherData = await WeatherModel.getWeatherDataForCurrentLocation();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          weather: WeatherModel(weatherData),
        ),
      ),
    );
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
