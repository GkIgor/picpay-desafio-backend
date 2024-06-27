import 'wallet.class.dart';

abstract class Account extends Wallet {
  late int? accountId;
  late String? agency;
  late String? account;
  late String? verifier;
  late DateTime? createdAt;

  Account({
    this.accountId,
    required this.agency,
    this.account,
    this.verifier,
    this.createdAt,
    super.walletId,
     super.balance,
    required super.lastUpdated,
  });
}
