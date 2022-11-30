import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class provider with ChangeNotifier{
  int count=0;

  increment(){
    count++;
  }
  decrement(){
    count--;
  }
}