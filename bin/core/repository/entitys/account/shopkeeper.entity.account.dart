class ShopkeeperAccount {
  late final int? id;
  late final String agency;
  late final String account;
  late final String verifier;
  late final int shopkeeperWallet;
  late final DateTime createdAt;

  ShopkeeperAccount({
    this.id,
    required this.agency,
    required this.account,
    required this.verifier,
    required this.shopkeeperWallet,
    required this.createdAt,
  });

  factory ShopkeeperAccount.fromMap(Map<String, dynamic> map) {
    return ShopkeeperAccount(
      id: map['id'],
      agency: map['agency'],
      account: map['account'],
      verifier: map['verifier'],
      shopkeeperWallet: map['shopkeeper_wallet'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  @override
  String toString() {
    return '$agency, $account, $verifier, $shopkeeperWallet';
  }
}
