abstract class Account {
  late int? id;
  late String agency;
  late String account;
  late String verifier;
  late DateTime createdAt;

  Account({
    this.id,
    required this.agency,
    required this.account,
    required this.verifier,
    required this.createdAt,
  });
}
