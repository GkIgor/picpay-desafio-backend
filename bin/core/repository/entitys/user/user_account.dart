import '../../../class/account.class.dart';

class UserAccount extends Account {
  UserAccount({
    super.accountId,
    required super.agency,
    required super.account,
    required super.verifier,
    required super.createdAt,
    super.walletId,
    required super.balance,
    required super.lastUpdated,
  });
}
