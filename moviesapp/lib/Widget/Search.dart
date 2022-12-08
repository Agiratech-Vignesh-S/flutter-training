import 'package:flutter/material.dart';
import 'package:moviesapp/Screen/Myhomepage.dart';
import 'package:moviesapp/provider/moviesprovider.dart';
import 'package:provider/provider.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) => [
    IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.close)),
  ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = '';
        }
      },
      icon: Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return MyHomePage();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final val = Provider.of<Moviesprovider>(context);

    List<String> suggestion = val.name.where((value) {
      final result=value.toLowerCase();
      final input=query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
        itemCount: suggestion.length,
        itemBuilder: (context, index) {
          final suggestions=suggestion[index];

          return ListTile(
            title: Text("${val.movieslist?.item[index].title}"),
            leading: CircleAvatar(
              backgroundImage: NetworkImage("https://image.tmdb.org/t/p/w185/${val.movieslist?.item[index].posterPath}"),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/Detial_screen',arguments: {'index':index});
              print(index);
            },
          );
        });
  }
}
