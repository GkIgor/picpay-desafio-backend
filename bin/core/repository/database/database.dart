import 'package:postgres/postgres.dart';

import '../../../environments/environments.dart';

class Database {
  static final Pool poll = Pool.withEndpoints([_endpoint], settings: _settings);

  static final Endpoint _endpoint = Endpoint(
    host: Environments.DATABASE_HOST,
    port: Environments.DATABASE_PORT,
    database: Environments.DATABASE_NAME,
    username: Environments.DATABASE_USERNAME,
    password: Environments.DATABASE_PASSWORD,
  );

  static final PoolSettings _settings = PoolSettings(
    sslMode: SslMode.disable,
    applicationName: 'dart api for test',
    connectTimeout: _connectTimeout,
    queryTimeout: _queryTimeout,
    maxConnectionCount: _maxConnectionCount,
  );

  static final Duration _connectTimeout =
      Duration(seconds: Environments.CONNECT_TIMEOUT);

  static final Duration _queryTimeout =
      Duration(seconds: Environments.QUERY_TIMEOUT);

  static final int _maxConnectionCount = Environments.MAX_CONNECTION_COUNT;
}
