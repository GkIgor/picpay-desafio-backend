import '../../../class/account.class.dart';

class UserAccount extends Account {
  int userWallet;
  UserAccount({
    required super.agency,
    required super.account,
    required super.verifier,
    required super.createdAt,
    required super.id,
    required this.userWallet,
  });

  factory UserAccount.fromMap(Map<String, dynamic> map) {
    return UserAccount(
      id: map['id'],
      agency: map['agency'],
      account: map['account'],
      verifier: map['verifier'],
      createdAt: DateTime.parse(map['created_at']),
      userWallet: map['user_wallet'],
    );
  }
  @override
  String toString() {
    return '$agency, $account, $verifier, $userWallet';
  }
}
