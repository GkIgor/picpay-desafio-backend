import '../../core/class/account.class.dart';
import '../../core/exceptions/user.exception.dart';
import '../../core/repository/database/querys/account.query.dart';
import '../../core/repository/entitys/account/user.entity.account.dart';
import '../../core/repository/entitys/user/users.entity.dart';

class AccountService {
  Future<Account> createAccount(
    User user,
    String agency,
  ) async {
    if (user.id == null) {
      throw ArgumentError('User ID cannot be null');
    }

    if (agency.isEmpty) {
      throw ArgumentError('Agency cannot be empty');
    }

    try {
      Map<String, dynamic> dataForNewAccount =
          await AccountQuery.createUserAccount(
        user.id!,
        agency,
      );
      return UserAccount.fromMap(dataForNewAccount);
    } catch (e) {
      throw UserNotFoundException('Failed to create account: $e');
    }
  }

  // String _generateVerificationCode(String account, String agency) {
  //   String accountString = '$account$agency';
  //   int accountLength = accountString.length;

  //   int verifyCode = 0;

  //   for (int i = 0; i < accountLength; i++) {
  //     int number;
  //     try {
  //       number = int.parse(accountString[i]) - 1;
  //     } catch (e) {
  //       throw ArgumentError('Invalid account or agency: $e');
  //     }
  //     verifyCode += number;
  //   }

  //   int verifier = verifyCode % accountLength;

  //   return '$verifier';
  // }
}
