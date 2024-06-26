import '../repository/entitys/user/users.entity.dart';

abstract class Wallet {
  int? id;
  double balance;
  DateTime lastUpdated;

  Wallet({
    this.id,
    required this.balance,
    required this.lastUpdated,
  });
}
