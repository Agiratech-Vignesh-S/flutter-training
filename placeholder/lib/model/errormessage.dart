class OwnHttpException implements Exception {
  final message;

  OwnHttpException({required this.message});
  @override
  String toString() {
    print('$message');
    return message;
    // return super.toString(); //Instance of exception
  }
}