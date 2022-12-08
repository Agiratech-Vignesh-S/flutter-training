import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:moviesapp/model/Listmodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Moviesprovider with ChangeNotifier{
//3/trending/movie/day'

  int indes =1;
  Movies? movieslist;
  Future<Movies> loadmovieslist() async {
      final response = await http.get(Uri.parse("https://api.themoviedb.org/3/trending/movie/day?api_key=b6ee00729c9ca9a458e3625f96877b1a&language=en-US"));
      final datas = json.decode(response.body);
      print(response.body);
      Movies data = Movies.fromJson(datas);
      print(data.item?.length);
      print("iv bfhv ${data.item[indes].title}");
      movieslist = data;
      notifyListeners();
      return movieslist!;
  }

  // Movies? movieslist;
  Future<Movies>searchmovies(String name)async{
    final response = await http.get(Uri.parse("https://api.themoviedb.org/3/search/movie?api_key=b6ee00729c9ca9a458e3625f96877b1a&language=en-US&query=${name}&page=1"));
    final datas = json.decode(response.body);
    print(response.body);
    Movies data = Movies.fromJson(datas);
    print(data.item?.length);
    movieslist = data;
    notifyListeners();
    return movieslist!;
  }
var query;
  void getMovie(String loc) async {
    query = loc;
    movieslist = await searchmovies(query);
    searchmovies(query);
    notifyListeners();
  }

  List<String> name=[];
  void loop(){
    for(int i=0;i<67;i++){
      name.add(movieslist?.item[i].title as String);
    }
    print(name);
  }
}