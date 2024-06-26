import '../../core/repository/database/querys/credentials.query.dart';
import '../../core/repository/entitys/user/users_credentials.entity.dart';

class CredentialsService {
  Future<UserCredentials> createCredentialsForUser(UserCredentials user) async {
    Map<String, dynamic> dataForNewCredentials =
        await CredentialsQuery.createCredentialsForUser(user);
    return UserCredentials.fromMap(dataForNewCredentials);
  }
}
