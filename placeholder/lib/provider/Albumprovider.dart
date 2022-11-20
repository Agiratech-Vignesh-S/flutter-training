import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:placeholder/model/Albummodel.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart'as http;

class AlbumProvider with ChangeNotifier {
  Album? albumdata;

  Future<Album> loadphoto() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/'),
    );
    if (response.statusCode == 200) {
      Album x = Album.fromJson(jsonDecode(response.body));
      albumdata = x;
//
      notifyListeners();
      return x;
    } else {
      throw Exception('Failed to load album');
    }
  }
  Future<void> getvalues() async {
    final response = await loadphoto();
    albumdata = response;
    notifyListeners();
  }

  Future<Detail> createAlbum(Detail det, String id) async {
    var x = json.encode(det.toJson());
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: x,
    );

    if (response.statusCode == 201) {
      var newValue = Detail.fromJson(jsonDecode(response.body));
      albumdata!.Details!.add(newValue);

      notifyListeners();
      return newValue;
    } else {
      throw Exception('Failed to create album.');
    }
  }
}