import '../../../class/credentials.class.dart';

class ShopkeeperCredentials extends Credentials {
  ShopkeeperCredentials({
    required super.id,
    required super.email,
    required super.password,
  });

  factory ShopkeeperCredentials.fromMap(Map<String, dynamic> map) {
    return ShopkeeperCredentials(
      id: map['id'] as int,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
}
