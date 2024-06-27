import '../database.dart';

class AccountQuery {
  static Future<Map<String, dynamic>> createUserAccount(
    int userId,
    String agency,
  ) async {
    return Database.poll.withConnection(
      (connection) async {
        final query = await connection.execute(
          'INSERT INTO users_account (user_id, agency) VALUES ($userId, $agency,) RETURNING *',
        );
        return query.first.toColumnMap();
      },
    );
  }

  static Future<Map<String, dynamic>> findAccountByUser(int userId) async {
    return Database.poll.withConnection(
      (connection) async {
        final query = await connection
            .execute('SELECT * FROM users_account WHERE users_account.user_id = $userId');
        return query.first.toColumnMap();
      },
    );
  }

  static Future<Map<String, dynamic>> findAccountByAgency(String agency) async {
    return Database.poll.withConnection(
      (connection) async {
        final query = await connection
            .execute('SELECT * FROM users_account WHERE users_account.agency = $agency');
        return query.first.toColumnMap();
      },
    );
  }

  static Future<Map<String, dynamic>> findTotalUsersAccounts() async {
    return Database.poll.withConnection(
      (connection) async {
        final query = await connection
            .execute('SELECT COUNT(*) FROM users_account');
        return query.first.toColumnMap();
      },
    );
  }
}
