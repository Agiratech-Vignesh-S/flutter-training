import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:watherapp/model/Weather.dart';

import '../model/Countries.dart';
class WeatherService with ChangeNotifier{
  List<String>searchResult=["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre &amp; Miquelon","Samoa","San Marino","Satellite","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"];
  var query;
  Weather weather = Weather();
  bool change=true;
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
    // print(weather.temperatureC);
    // print(weather.temperatureF);
    // print(weather.condition);
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
  late List countryList=[];
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

  void changeval(bool val){
    change=val;
    notifyListeners();
  }


}