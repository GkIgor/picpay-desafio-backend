import '../exceptions/cpf.exception.dart';

class Cpf {
  late final String _cpf;

  Cpf({required String cpf}) {
    _cpf = cpf.replaceAll(RegExp(r'\D'), '');
    if (!isValid()) {
      throw CpfInvalidException('O CPF FORNECIDO É INVALIDO');
    }
  }

  bool isValid() {
    if (_cpf.length != 11) {
      throw CpfMinLengthException('CPF DEVE CONTER NO 11 DÍGITOS');
    }

    for (var i in _cpf.split('')) {
      int? number = int.tryParse(i);

      if (number == null) {
        throw CpfContainsNoValidNumberException(
          'CPF DEVE CONTER APENAS NÚMEROS',
        );
      }
    }

    List<int> numbers = _cpf.substring(0, 9).split('').map(int.parse).toList();

    int digito1 = _calcDigit(numbers, 10);
    numbers.add(digito1);
    int digito2 = _calcDigit(numbers, 11);

    return _cpf.endsWith('$digito1$digito2');
  }

  int _calcDigit(List<int> numbers, int weight) {
    int sum = numbers.asMap().entries.map((entry) {
      int i = entry.key;
      int value = entry.value;
      return value * (weight - i);
    }).reduce((a, b) => a + b);

    int rest = sum % 11;
    return rest < 2 ? 0 : 11 - rest;
  }

  @override
  String toString() => _cpf;
}
