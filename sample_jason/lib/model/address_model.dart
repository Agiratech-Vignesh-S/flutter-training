import 'dart:convert';

class Address {
   String city;
  List<String> streets;

  Address({
    required this.city,
    required this.streets
  });

  factory Address.fromJson(Map<String, dynamic> parsedJson) {
    List<String> streets = List.from(parsedJson['streets']);

    return Address(
      city: parsedJson['city'],
      streets: streets,
    );
  }

}