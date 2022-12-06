import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weathermodel/provider/Provider.dart';

import 'model/Country.dart';


@override
Widget Autocompleted(BuildContext context) {
  final val = Provider.of<WeatherProvider>(context);
  return Autocomplete<Country>(
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
            style:  TextStyle(color: Colors.black),
            controller: controller,
            focusNode: node,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              counterStyle: TextStyle(color: Colors.white),
              hintText: 'Type here...',
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
      onSelected: (selection) {
        val.changeval(false);
        val.getWeather(selection.country as String);
        print('You just selected ${selection.country}');
      },
      displayStringForOption: (Country d) => '${d.country!}',
    );
}