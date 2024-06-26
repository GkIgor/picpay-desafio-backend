import '../../../class/credentials.class.dart';

class UserCredentials extends Credentials {
  UserCredentials({
    required super.id,
    required super.email,
    required super.password,
  });

  factory UserCredentials.fromMap(Map<String, dynamic> map) {
    return UserCredentials(
      id: map['id'] as int,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
}
