class WalletAlreadyExistsException implements Exception {
  final String message;
  WalletAlreadyExistsException(this.message);
}
