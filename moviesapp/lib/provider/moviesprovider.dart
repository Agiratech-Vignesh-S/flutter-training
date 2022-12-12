import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:moviesapp/model/Listmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../model/movievideomodel.dart';
class Moviesprovider with ChangeNotifier{
var api='b6ee00729c9ca9a458e3625f96877b1a';

  var top;
  int indes =1;
  Movies? movieslist;
  Future<Movies> loadmovieslist() async {
      final response = await http.get(Uri.parse("https://api.themoviedb.org/3/trending/movie/day?api_key=$api&language=en-US"));
      final datas = json.decode(response.body);
      print(response.body);
      Movies data = Movies.fromJson(datas);
      print(data.item?.length);
      print("iv bfhv ${data.item[indes].title}");
      movieslist = data;
      notifyListeners();
      return movieslist!;
  }
  Future<Movies>searchmovies(String name)async{
    final response = await http.get(Uri.parse("https://api.themoviedb.org/3/search/movie?api_key=$api&language=en-US&query=${name}&page=1"));
    final datas = json.decode(response.body);
    print(response.body);
    Movies data = Movies.fromJson(datas);
    print(data.item?.length);
    movieslist = data;
    notifyListeners();
    return movieslist!;
  }

  Videos? videos;
  Future<Videos> loadVideo(int value) async {
    try {
      final url = Uri.http('api.themoviedb.org', '/3/movie/$value/videos', {
        'api_key': api,
      });
      final response = await http.get(url);
      Videos videosData = Videos.fromJson(jsonDecode(response.body));
      videos = videosData;
      notifyListeners();
      return videos!;
    } catch (e) {
      throw 'error Occured';
    }
    // return videos!;
  }

  String? videokey(){
    notifyListeners();
    if(videos!.item[0].keyValue!= null)
       return videos!.item[0].keyValue as String;
  }
var query;
  void getMovie(String loc) async {
    query = loc;
    movieslist = await searchmovies(query);
    searchmovies(query);
    notifyListeners();
  }



}