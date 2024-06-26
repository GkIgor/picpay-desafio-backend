import '../../../class/wallet.class.dart';

class UserWallet extends Wallet {
  int userId;

  UserWallet({
    required this.userId,
    required super.balance,
    required super.lastUpdated,
    super.id,
  });

  factory UserWallet.fromMap(Map<String, dynamic> map) {
    return UserWallet(
      userId: map['user_id'],
      balance: map['balance'],
      lastUpdated: map['last_updated'],
      id: map['id'],
    );
  }

  @override
  String toString() => '$userId, $balance, $lastUpdated';
}
