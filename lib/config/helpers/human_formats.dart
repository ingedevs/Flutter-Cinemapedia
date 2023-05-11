import 'package:intl/intl.dart';

class HumanFormats {
  static String number(double number) {
    final formatter = NumberFormat.compact();
    return formatter.format(number);
  }
}
