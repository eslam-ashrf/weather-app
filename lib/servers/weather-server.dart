import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather-model.dart';

class WeatherServes {
  Future<WeatherModel> getWeather({required String cityName}) async {
    String baseUrl='http://api.weatherapi.com/v1';
    String keyUrl='fe9c717754a84b45b00234028221409';
    Uri url=Uri.parse(
        '$baseUrl/forecast.json?key=$keyUrl&q=$cityName&days=7');
    http.Response response = await http.get(url);
    Map <String,dynamic>data=jsonDecode(response.body);
   WeatherModel weather = WeatherModel.fromJson(data);
   return weather;
  }
}
