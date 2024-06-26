class UserAlreadyExistsException implements Exception {
  final String message;
  UserAlreadyExistsException(this.message);

  @override
  String toString() => 'Message: $message';
}
