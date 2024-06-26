class Transactions {
  late final int id;
  late final int toUser;
  late final String status;
  late final int fromUser;
  late final String typeUser;
  late final double value;
  late final DateTime timestamp;
  late final String hash;

  Transactions({
    required this.id,
    required this.toUser,
    required this.status,
    required this.fromUser,
    required this.typeUser,
    required this.value,
    required this.timestamp,
    required this.hash,
  });

  Transactions.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    toUser = map['to_user'];
    status = map['status'];
    fromUser = map['from_user'];
    typeUser = map['type_user'];
    value = map['value'];
    timestamp = DateTime.parse(map['timestamp']);
    hash = map['hash'];
  }
}
