import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../core/repository/entitys/user/users.entity.dart';
import '../../services/users/users.service.dart';

Future<Response> findUsers(Request request) async {
  final jsonUsers = 'users';
  return Response.ok(
    jsonEncode(jsonUsers),
    headers: {
      'Content-Type': 'application/json',
    },
  );
}

Future<Response> createUser(Request request) async {
  try {
    final body = await request.readAsString();

    if (body.isEmpty) {
      throw FormatException('JSON INVALIDO');
    }

    final parsedBody = jsonDecode(body);
    if (parsedBody is! Map<String, dynamic>) {
      throw FormatException('JSON INVALIDO');
    }

    final user = await UserServices.createNewUser(User.fromMap(parsedBody));

    return Response.ok(
      jsonEncode(user.toMap()),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  } catch (e, s) {
    print(DateTime.now());
    print(s);

    return Response.badRequest(
      body: jsonEncode(e),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }
}
