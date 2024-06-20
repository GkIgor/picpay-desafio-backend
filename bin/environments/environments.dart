// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:io';

class Environments {
  static final bool PROD = Platform.environment['APP_ENV'] == 'production';

  static final int PORT =
      int.tryParse(Platform.environment['PORT'] ?? '8080') ?? 8080;

  static final int DATABASE_PORT =
      int.tryParse(Platform.environment['DATABASE_PORT'] ?? '5432') ?? 5432;

  static final String DATABASE_HOST =
      Platform.environment['DATABASE_HOST'] ?? "localhost";

  static final String DATABASE_NAME =
      Platform.environment['DATABASE_NAME'] ?? "postgres";

  static final String DATABASE_USERNAME =
      Platform.environment['DATABASE_USERNAME'] ?? "postgres";

  static final String DATABASE_PASSWORD =
      Platform.environment['DATABASE_PASSWORD'] ?? "postgres";

  static final int CONNECT_TIMEOUT =
      int.tryParse(Platform.environment['CONNECT_TIMEOUT'] ?? '15') ?? 15;

  static final int QUERY_TIMEOUT =
      int.tryParse(Platform.environment['QUERY_TIMEOUT'] ?? '30') ?? 30;

  static final int MAX_CONNECTION_COUNT =
      int.tryParse(Platform.environment['PORT'] ?? '8080') ?? 8080;
}
