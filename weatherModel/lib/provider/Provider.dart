import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart'as http;
import '../model/Country.dart';
import '../model/Weather.dart';
class WeatherProvider with ChangeNotifier{
  var top;
  var query;
  Weather weather = Weather();
  Future<Weather> getWeatherData(String place) async {
    try {
      final queryParameters = {
        'key': '6988a485e5d74e7e97592223220212',
        'q': place,

      };
      final uri = Uri.http('api.weatherapi.com', '/v1/current.json', queryParameters);
      final response = await http.get(uri);
      if(response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Can not get weather");
      }
    } catch(e) {
      rethrow;
    }
  }

  void getWeather(String loc) async {
    query = loc;
    weather = await getWeatherData(query);

    notifyListeners();
  }
  bool change=true;
  bool changes=false;
  void changeval(bool val){
    change=val;
    changes=val;
    notifyListeners();
  }

  String image(){
    if(weather.condition=="Overcast"){
      return "https://images.unsplash.com/photo-1499956827185-0d63ee78a910?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8b3ZlcmNhc3QlMjBza3l8ZW58MHx8MHx8&w=1000&q=80";
    }else if(weather.condition=="Clear"){
      return "https://media.istockphoto.com/id/517897328/photo/beautiful-sky-with-white-cloud-background.jpg?b=1&s=170667a&w=0&k=20&c=kDH_rxWr5uk7UlFIqTYnSTFZfKQC5wIhiIlZuNWd66E=";
    }else if(weather.condition=="Partly cloudy"){
      return "https://c0.wallpaperflare.com/preview/898/598/520/party-clouds.jpg";
    }else if(weather.condition=="Mist"){
      return "https://wallup.net/wp-content/uploads/2016/01/274137-nature-landscape-purple-sky-mist-mountain-sunset-forest-clouds.jpg";
    }else if(weather.condition=="Sunny"){
      return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaZcGpjBBNyJafnWxT4LS8CxhDLQFkLDC_TeTbuAvq_U_EwiJ-dhIDH8BAR5PDMhQ9NMs&usqp=CAU";
    }else if(weather.condition=="Light snow"){
      return "https://media.istockphoto.com/id/1066960598/photo/winter-holiday-background-with-snow-copy-space.jpg?s=612x612&w=0&k=20&c=KjOIp2ns1988noHZXBT8DbS3fOlhd_GXSHsoO7vtAeE=";
    }else if(weather.condition=="Fog"){
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/TreesInTheFog.jpg/1200px-TreesInTheFog.jpg";
    }else{
      return "https://images.unsplash.com/photo-1590861115101-ef19a4191cd2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHdhdnl8ZW58MHx8MHx8&w=1000&q=80";
    }
  }
  Countries? countries;
  Future<Countries> loadCountries() async {
    try {
      final response = await http
          .get(Uri.parse('https://countriesnow.space/api/v0.1/countries'));
      final datas = json.decode(response.body);
      Countries data = Countries.fromJson(datas);
      countries = data;
      notifyListeners();
      return countries!;
    } catch (e) {
      throw 'Error Occured in loading data';
    }
  }
}