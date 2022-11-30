var urLfet ="https://flutter-shop-11bc3-default-rtdb.firebaseio.com/api.json";
String Url1(String id){
  String first="https://flutter-shop-11bc3-default-rtdb.firebaseio.com/api/";
  String endpoint=".json";
  String url=first+id+endpoint;
  return url;
}