import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/Service.dart';
import 'model/Countries.dart';

@override
PreferredSizeWidget Autocompleted(BuildContext context) {
  final val = Provider.of<WeatherService>(context);
  return AppBar(
    backgroundColor: Colors.white,
    title: Autocomplete<Country>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return List.empty();
        } else {
          return val.countries!.data!
              .where((element) => element.country!
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase()))
              .toList();
        }
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController controller,
          FocusNode node,
          Function onSubmit) =>
          TextField(
            style: const TextStyle(color: Colors.black),
            controller: controller,
            focusNode: node,
            decoration: const InputDecoration(
              counterStyle: TextStyle(color: Colors.white),
              hintText: 'Type here...',
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
      onSelected: (selection) {
         val.changeval(true);
        val.getWeather(selection.country as String);
        print('You just selected ${selection.country}');
      },
      displayStringForOption: (Country d) => '${d.country!}',
    ),
    actions: [
      IconButton(onPressed: (){
        val.change=false;
      }, icon: Icon(Icons.close,color: Colors.black,))
    ],
  );
}