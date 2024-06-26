import 'dart:convert';
import 'core/repository/database/database.dart';

Future<void> main(List<String> args) async {
  if (args.contains('-h') || args.contains('--help')) {
    print(
      'Use: db -h, --help\n para ler a documentação.\n\n',
    );

    print(
      'Use db -t, --table\n para mostrar as tabelas do banco de dados.\n\n',
    );

    print(
      'Use: db --create-table\n para montar as tabelas do banco de dados.\n\n',
    );

    return;
  }

  if (args.contains('-t') || args.contains('--table')) {
    try {
      final tables = await Database.poll.withConnection((conn) async {
        final query = await conn.execute(
          'SELECT table_name FROM information_schema.tables WHERE table_schema = \'public\' AND table_type = \'BASE TABLE\';',
        );

        return jsonEncode(query.first.toColumnMap());
      });

      print('\n\n');
      print(tables);
      return;
    } catch (e, s) {
      print(
        'Oops, parece que não existe uma conexão com um banco de dados!\n\n\n $s',
      );
      return;
    }
  }

  if (args.contains('--create-table')) {
    try {
      const createTable = '''
        CREATE TABLE IF NOT EXISTS users (
          id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
          name VARCHAR(80) NOT NULL CHECK (name <> ''),
          cpf VARCHAR(11) NOT NULL UNIQUE CHECK (cpf <> ''),
          email VARCHAR(65) NOT NULL UNIQUE CHECK (email <> ''),
          type_user VARCHAR(3) NOT NULL DEFAULT 'USR' CHECK (type_user = 'USR')
        );

        CREATE TABLE IF NOT EXISTS shopkeeper (
          id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
          name VARCHAR(80) NOT NULL CHECK (name <> ''),
          cnpj VARCHAR(14) NOT NULL UNIQUE CHECK (cnpj <> ''),
          email VARCHAR(65) NOT NULL UNIQUE CHECK (email <> ''),
          type_user VARCHAR(3) NOT NULL DEFAULT 'SHP' CHECK (type_user = 'SHP')
        );

        CREATE TABLE IF NOT EXISTS users_credentials (
          id INTEGER REFERENCES users(id),
          email VARCHAR(65) REFERENCES users(email),
          password VARCHAR(100) NOT NULL CHECK (password <> '')
        );

        CREATE TABLE IF NOT EXISTS shopkeeper_credentials (
          id INTEGER REFERENCES shopkeeper(id),
          email VARCHAR(65) REFERENCES shopkeeper(email),
          password VARCHAR(100) NOT NULL CHECK (password <> '')
        );

        CREATE TABLE IF NOT EXISTS transactions (
          id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
          to_user INTEGER NOT NULL,
          status VARCHAR(10) NOT NULL,
          from_user INTEGER NOT NULL,
          type_user VARCHAR(3) NOT NULL,
          value NUMERIC NOT NULL,
            timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
          hash VARCHAR(50) UNIQUE NOT NULL
        );

        CREATE TABLE IF NOT EXISTS user_wallet (
            id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
            user_id INTEGER NOT NULL REFERENCES users(id),
            balance DECIMAL(30, 2) NOT NULL DEFAULT 0.00,
            last_updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
            CHECK (balance >= 0)
        );

        CREATE TABLE IF NOT EXISTS shopkeeper_wallet (
            id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
            user_id INTEGER NOT NULL REFERENCES shopkeeper(id),
            balance DECIMAL(50, 2) NOT NULL DEFAULT 0.00,
            last_updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
            CHECK (balance >= 0)
        );

        CREATE TABLE IF NOT EXISTS user_account (
          id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
          agency VARCHAR(10) NOT NULL CHECK (agency <> ''),
          account VARCHAR(100) NOT NULL DEFAULT '0000',
          verifier VARCHAR(2) NOT NULL CHECK (verifier <> ''),
          user_wallet INTEGER NOT NULL REFERENCES user_wallet(id),
          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );

        CREATE TABLE IF NOT EXISTS shopkeeper_account (
          id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
          agency VARCHAR(10) NOT NULL CHECK (agency <> ''),
          account VARCHAR(100) NOT NULL DEFAULT '0000',
          verifier VARCHAR(2) NOT NULL CHECK (verifier <> ''),
          shopkeeper_wallet INTEGER NOT NULL REFERENCES shopkeeper_wallet(id),
          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );
      ''';

      final tables = await Database.poll.withConnection((conn) async {
        await conn.execute(createTable);
        final query = await conn.execute(
          'SELECT table_name FROM information_schema.tables WHERE table_schema = \'public\' AND table_type = \'BASE TABLE\';',
        );

        return jsonEncode(query.first.toColumnMap());
      });

      print('\n\n');
      print(tables);
      return;
    } catch (e, s) {
      print(
        'Oops, parece que não existe uma conexão com um banco de dados!\n\n\n $s',
      );
      return;
    }
  }

  print(
    'Use: db -h, --help\n para ler a documentação.\n\n',
  );

  print(
    'Use db -t, --table\n para mostrar as tabelas do banco de dados.\n\n',
  );

  print(
    'Use: db --create-table\n para montar as tabelas do banco de dados.\n\n',
  );

  return;
}
