import '../../core/class/wallet.class.dart';
import '../../core/exceptions/wallet.exception.dart';
import '../../core/repository/database/querys/wallet.query.dart';
import '../../core/repository/entitys/user/user_wallet.entity.dart';
import '../../core/repository/entitys/user/users.entity.dart';

class WalletService {
  Future<Wallet> createWallet(User user) async {
    if (user.wallet != null) {
      throw WalletAlreadyExistsException(
        'O USUÁRIO JA POSSUI UMA CARTEIRA',
      );
    }

    Map<String, dynamic> dataForNewWallet =
        await WalletQuery.createUserWallet(user.id!);

    return UserWallet.fromMap(dataForNewWallet);
  }
}
