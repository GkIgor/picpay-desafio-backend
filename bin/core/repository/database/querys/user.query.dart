import '../../entitys/user/users.entity.dart';
import '../database.dart';

class UserQuery {
  static Future<Map<String, dynamic>> createUser(User user) {
    return Database.poll.withConnection((connection) async {
      final query = await connection.execute(
        'INSERT INTO users (name, cpf, email, type_user) VALUES (${user.toString()});',
      );
      return query.first.toColumnMap();
    });
  }

  static Future<Map<String, dynamic>> findUserById(int id) {
    return Database.poll.withConnection((conn) async {
      final query = await conn.execute('SELECT * FROM users WHERE users.id = $id RETURNING *');
      return query.first.toColumnMap();
    });
  }
}
