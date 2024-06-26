import '../../core/exceptions/user.exception.dart';
import '../../core/repository/database/querys/credentials.query.dart';
import '../../core/repository/database/querys/user.query.dart';
import '../../core/repository/database/querys/wallet.query.dart';
import '../../core/repository/entitys/user/user_wallet.entity.dart';
import '../../core/repository/entitys/user/users.entity.dart';
import '../../core/repository/entitys/user/users_credentials.entity.dart';

class UserServices {
  static Future<User> createNewUser(User user) async {
    if (user.id != null) {
      final userInDatabase = await UserQuery.findUserById(user.id!);
      if (userInDatabase.isNotEmpty) {
        throw UserAlreadyExistsException(
          'USUÁRIO ${userInDatabase.toString()} JÁ EXISTE',
        );
      }
    }

    final dataForNewUser = await UserQuery.createUser(user);
    final dataForNewWallet = await WalletQuery.createUserWallet(
      dataForNewUser['id'] as int,
    );
    final dataForNewCredentials =
        await CredentialsQuery.createCredentialsForUser(
      user.createCredentials(),
    );
    dataForNewUser['credentials'] =
        UserCredentials.fromMap(dataForNewCredentials);

    dataForNewUser['wallet'] = UserWallet.fromMap(dataForNewWallet);

    return User.fromMap(dataForNewUser);
  }
}
