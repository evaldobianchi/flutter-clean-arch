class AuthExeption implements Exception {
  final String message;

  AuthExeption(this.message);

  @override
  String toString() {
    return 'Auth: $message';
  }
}
