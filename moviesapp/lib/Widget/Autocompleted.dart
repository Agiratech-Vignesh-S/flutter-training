import 'package:flutter/material.dart';
import 'package:moviesapp/model/Listmodel.dart';
import 'package:moviesapp/provider/moviesprovider.dart';
import 'package:provider/provider.dart';


@override
Widget Autocompleted(BuildContext context) {
  final val = Provider.of<Moviesprovider>(context);
  return Autocomplete<MovieData>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        val.query=textEditingValue.toString();
        if (textEditingValue.text =='') {
          return List.empty();
        }
        else {
          return  val.movieslist!.item
              .where((element) => element.title!
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase()))
              .toList();
        }
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController controller,
          FocusNode node,
          Function onSubmit) {
          return TextField(

            onSubmitted: (value) {
              print(value);
              if(value==""){
                val.loadmovieslist();
              }else{
                val.query=value;
                val.getMovie(val.query);
              }
            },
            style: TextStyle(color: Colors.white),
            controller: controller,
            focusNode: node,
            decoration:  const InputDecoration(
              suffixIcon: Icon(Icons.mic,color: Colors.black54,),
              border: InputBorder.none,
              counterStyle: TextStyle(color: Colors.white),
              hintText: 'Type here...',
              hintStyle: TextStyle(color: Colors.white),
            ),
          );},

      onSelected: (selection) {
        print(selection.title);
        int index = val.movieslist!.item
            .indexWhere((element) => element.id == selection.id);
       val.getMovie(selection.title!.toString());
      },
      displayStringForOption: (MovieData d) => '${d.title}',
    );
}