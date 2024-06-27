//@Entity
import '../../../class/account.class.dart';
import '../../../class/cpf.class.dart';
import '../../../class/credentials.class.dart';
import '../../../class/wallet.class.dart';
import '../account/user.entity.account.dart';
import 'user_wallet.entity.dart';
import 'users_credentials.entity.dart';

class User {
  late final int? _id;
  late final String _name;
  late final Cpf _cpf;
  late final String _email;
  late final String _typeUser;
  late final String? _password;
  late final Wallet? _wallet;
  late final Credentials? _credentials;

  User({
    int? id,
    required String name,
    required Cpf cpf,
    required String email,
    required String typeUser,
    String? password,
    Wallet? wallet,
    Credentials? credentials,
  })  : _cpf = cpf,
        _name = name,
        _email = email,
        _id = id,
        _typeUser = typeUser,
        _wallet = wallet,
        _credentials = credentials;

  User.fromMap(Map<String, dynamic> user) {
    _cpf = Cpf(cpf: user['cpf']);
    _name = user['name'];
    _email = user['email'];
    _id = user['id'];
    _typeUser = user['type_user'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'name': _name,
      'cpf': _cpf.toString(),
      'email': _email,
      'type_user': _typeUser,
    };
  }

  int? get id => _id;
  String get name => _name;
  Cpf get cpf => _cpf;
  String get email => _email;
  String get typeUser => _typeUser;
  String? get password => _password;
  Wallet? get wallet => _wallet;
  Credentials? get credentials => _credentials;

  @override
  String toString() => '$name, ${cpf.toString()}, $email, $typeUser';

  Wallet createWallet() {
    return UserWallet(
      balance: 0,
      lastUpdated: DateTime.now(),
      walletId: null,
      userId: _id!,
    );
  }

  Credentials createCredentials() {
    if (_password == null) {
      throw Exception('SENHA NÃO INFORMADA');
    }
    return UserCredentials(id: _id!, email: email, password: _password);
  }
}
