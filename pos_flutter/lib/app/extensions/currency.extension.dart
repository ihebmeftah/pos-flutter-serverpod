import 'package:pos_client/pos_client.dart';

extension CurrencyExtension on Currency? {
  String get symbol {
    switch (this) {
      case Currency.USD:
        return '\$';
      case Currency.EUR:
        return '€';
      case Currency.TND:
        return 'DT';
      default:
        return this!.name.toString();
    }
  }
}
