import 'package:flutter/material.dart';

class OwnHttpException implements Exception {
  final String message;

  OwnHttpException({required this.message});
  @override
  String toString() {
    return message;
  }
}