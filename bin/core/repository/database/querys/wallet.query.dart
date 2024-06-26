import '../database.dart';

class WalletQuery {
  static Future<Map<String, dynamic>> createUserWallet(int user) {
    return Database.poll.withConnection((connection) async {
      final query = await connection
          .execute('INSERT INTO user_wallet (user_id) VALUES ($user) RETURNING *');
      return query.first.toColumnMap();
    });
  }
}
