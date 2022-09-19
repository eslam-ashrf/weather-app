class WeatherModel {
  String? date;
  double? temp;
  double? maxTemp;
  double? minTemp;
  String? condition;
  String? icon;
  WeatherModel(
      {required this.date,
      required this.icon,
      required this.condition,
      required this.maxTemp,
      required this.minTemp,
      required this.temp});
  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    var json = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: data['location']['localtime'],
        icon: json['condition']['icon'],
        condition: json['condition']['text'],
        maxTemp: json['maxtemp_c'],
        minTemp: json['mintemp_c'],
        temp: json['avgtemp_c']);
  }
}
