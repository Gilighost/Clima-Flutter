import 'location.dart';
import 'networking.dart';

const openWeatherApiUrl = 'http://api.openweathermap.org/data/2.5/weather';
const openWeatherApiKey = 'e5bb752d337aea8306adc3206b3a018b';

class WeatherModel {
  int _condition;
  int _temperature;
  String _cityName;

  WeatherModel(dynamic weatherData) {
    print(weatherData);
    if (weatherData != null) {
      _condition = weatherData['weather'][0]['id'];
      _temperature = weatherData['main']['temp'].toInt();
      _cityName = weatherData['name'];
    }
  }

  static Future<dynamic> getWeatherDataForCurrentLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    return await _getWeatherData(
      latitude: location.latitude,
      longitude: location.longitude,
    );
  }

  static Future<dynamic> _getWeatherData(
      {double latitude, double longitude}) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherApiUrl?lat=$latitude&lon=$longitude&units=imperial&appid=$openWeatherApiKey');

    return await networkHelper.getData();
  }

  String get temperature => _temperature != null ? '$_temperature°' : 'Error';

  String getWeatherIcon() {
    if (_condition < 300) {
      return '🌩';
    } else if (_condition < 400) {
      return '🌧';
    } else if (_condition < 600) {
      return '☔️';
    } else if (_condition < 700) {
      return '☃️';
    } else if (_condition < 800) {
      return '🌫';
    } else if (_condition == 800) {
      return '☀️';
    } else if (_condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage() {
    String message;
    if (_temperature > 77) {
      message = 'It\'s 🍦 time';
    } else if (_temperature > 68) {
      message = 'Time for shorts and 👕';
    } else if (_temperature >= 50) {
      message = 'Bring a 🧥 just in case';
    } else if (_temperature < 50) {
      message = 'You\'ll need 🧣 and 🧤';
    } else {
      return "Could not retrieve weather.";
    }

    return '$message in $_cityName';
  }
}
