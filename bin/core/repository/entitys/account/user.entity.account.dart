import '../../../class/account.class.dart';
import '../user/users.entity.dart';

class UserAccount extends Account {
  int userWallet;
  UserAccount({
    required super.agency,
    super.account,
    super.verifier,
    super.createdAt,
    required super.accountId,
    required this.userWallet,
    super.balance,
    required super.lastUpdated,
  });

  factory UserAccount.fromMap(Map<String, dynamic> map) {
    return UserAccount(
      accountId: map['id'],
      agency: map['agency'],
      account: map['account'],
      verifier: map['verifier'],
      createdAt: DateTime.parse(map['created_at']),
      userWallet: map['user_wallet'],
      balance: map['balance'],
      lastUpdated: DateTime.now(),
    );
  }

  factory UserAccount.byUser(User user, String agency) {
    return UserAccount(
      accountId: user.id!,
      createdAt: DateTime.now(),
      userWallet: user.createWallet().walletId!,
      balance: 0,
      lastUpdated: DateTime.now(),
      agency: agency,
    );
  }

  @override
  String toString() {
    return '$agency, $account, $verifier, $userWallet';
  }
}
