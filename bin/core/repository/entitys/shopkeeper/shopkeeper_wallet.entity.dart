class ShopkeeperWallet {
  late final int id;
  late final int userId;
  late final double balance;
  late final DateTime lastUpdated;

  ShopkeeperWallet({
    required this.id,
    required this.userId,
    required this.balance,
    required this.lastUpdated,
  });
}
