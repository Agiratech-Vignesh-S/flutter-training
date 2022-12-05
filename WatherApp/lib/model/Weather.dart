class Weather {
  final double temperatureC;
  final String datetime;
  final String condition;

  Weather({
    this.temperatureC = 0,
    this.datetime = "2022-12-02 09:15",
    this.condition = "Sunny",
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperatureC: json['current']['temp_c'],
      datetime: json['location']['localtime'],
      condition: json['current']['condition']['text'],
    );
  }
}

//6988a485e5d74e7e97592223220212  -  http://api.weatherapi.com/v1