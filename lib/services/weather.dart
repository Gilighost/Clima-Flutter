class WeatherModel {
  int _condition;
  int _temperature;
  String _cityName;

  WeatherModel(dynamic weatherData) {
    _condition = weatherData['weather'][0]['id'];
    _temperature = weatherData['main']['temp'].toInt();
    _cityName = weatherData['name'];
  }

  int get temperature => _temperature;

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
    } else if (_temperature < 50) {
      message = 'You\'ll need 🧣 and 🧤';
    } else {
      message = 'Bring a 🧥 just in case';
    }

    return '$message in $_cityName';
  }
}
