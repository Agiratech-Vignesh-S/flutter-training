import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/http_exception.dart';
class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expirydate;
  String? _UserID;
  Timer? _authTimer;

  bool get isAuth {
    print('token.isNotEmpty${token.isNotEmpty}');
    return token != '';
  }

  String get UserId {
    return _UserID!;
  }

  String get token {
    if (_expirydate != null &&
        _expirydate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token!;
    }
    return '';
  }


  Future<void> _authenticate(String email, String password,
      String urlsegment) async {
    final url = Uri.parse(
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/$urlsegment?key=AIzaSyCsHNIz6SC1v8GoLm9i9gNiweE3wm6Vbx0');
    print(email);
    print(password);
    try {
      final res = await http.post(url, body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true
      }));
      final responsedata = json.decode(res.body);
      if (responsedata['error'] != null) {
        throw HttpException(responsedata['error']['message']);
      }
      _token = responsedata['idToken'];
      _UserID = responsedata['localId'];
      _expirydate = DateTime.now().add(
          Duration(seconds: int.parse(responsedata['expiresIn'])));
      autologout();
      notifyListeners();
      final perf = await SharedPreferences.getInstance();
      final Userdata=json.encode({
        'token':_token,
        '_UserID':_UserID,
        '_expirydate':_expirydate,
      });
      perf.setString("Userdata", Userdata);
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signupNewUser');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'verifyPassword');
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCsHNIz6SC1v8GoLm9i9gNiweE3wm6Vbx0');
  }

  Future<bool>TryAutoLogin()async{
    final  prefs=await SharedPreferences.getInstance();
    if(prefs.containsKey("Userdata")) {
      return false;
    }
    String encode=prefs.getString('Userdata').toString();
    final extractedUserDate=json.decode(encode)as Map<String,Object>;
    final expirydate=DateTime.parse(extractedUserDate['_expirydate']as String);
    if(_expirydate!.isBefore(DateTime.now())){
      return false;
    }
    _token=extractedUserDate['token'] as String;
    _UserID=extractedUserDate['UserID'] as String;
    DateTime etime = DateTime.parse(extractedUserDate['expiryDate']as String);
    _expirydate = etime;
     notifyListeners();
     autologout();
    return true;
  }


  Future<void> logout() async {
    _token = '';
    _UserID = '';
    _expirydate = null;
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    notifyListeners();
  final prefs=await SharedPreferences.getInstance();
  prefs.clear();
  }

  void autologout(){
    if(_authTimer!=null){
      _authTimer!.cancel();
    }
    final TimeToExpire=_expirydate!.difference(DateTime.now()).inSeconds;
    _authTimer=Timer(Duration(seconds: TimeToExpire), () {
      logout();
    });
  }
}