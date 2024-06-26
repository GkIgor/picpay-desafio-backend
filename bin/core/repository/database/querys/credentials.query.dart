import '../../../class/credentials.class.dart';
import '../database.dart';

class CredentialsQuery {
  static Future<Map<String, dynamic>> createCredentialsForUser(
    Credentials user,
  ) {
    return Database.poll.withConnection(
      (connection) async {
        final query = await connection.execute(
          'INSERT INTO users_credentials (id, email, password) VALUES (${user.id}, ${user.email}, ${user.password}) RETURNING *',
        );
        return query.first.toColumnMap();
      },
    );
  }
}
