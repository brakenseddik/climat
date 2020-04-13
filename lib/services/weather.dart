import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '0693a6ae0960414597cbfcad849dd0f3';
const openWeatherMap = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMap?q=$cityName&appid=$apiKey&units=metric';
    networkHelper nt = networkHelper(uri: url);
    var weatherData = await nt.getData();
    return weatherData;
  }

  Future<dynamic> getlocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    networkHelper nethelper = networkHelper(
        uri:
            '$openWeatherMap?lat=${location.latitude}&lon=${location.longtude}&appid=$apiKey&units=metric');
    var weatherData = await nethelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
