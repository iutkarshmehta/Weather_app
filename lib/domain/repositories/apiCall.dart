import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app1/data/models/modelClass.dart';


class WeatherServices{
  final String _apiUrl = 'http://api.weatherapi.com/v1/current.json?key=67f20837604146b4aa971229232303&q=Mumbai&aqi=no';

  Future<WeatherData> getWeather() async {
    WeatherData weatherData;
    //calling the api
    final response = await http.get(Uri.parse(_apiUrl));

    if (response.statusCode == 200) {

      var jsonResponse = json.decode(response.body);
      weatherData = WeatherData.fromJson(jsonResponse);

    }
    else
    {
      throw Exception('Failed to load weather data');
    }
    return weatherData;
  }
}