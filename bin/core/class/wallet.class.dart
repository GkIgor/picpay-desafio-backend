abstract class Wallet {
  int? walletId;
  double? balance;
  DateTime lastUpdated;

  Wallet({
    this.walletId,
    required this.balance,
    required this.lastUpdated,
  });
}
