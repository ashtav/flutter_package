import 'ansi.dart';
import 'package:intl/intl.dart';

String ___sTrExtName = 'StringExtension';

extension CustomStringExtension on String {
  /// ``` dart
  /// print('a4'.isNumeric); // false
  /// print('99'.isNumeric); // true
  /// ```
  bool get isNumeric {
    if (this == null) {
      return false;
    }

    return double.tryParse(this) != null;
  }

  /// ``` dart
  /// print('lorem ipsum dolor'.ucwords); // Lorem Ipsum Dolor
  /// ```
  String get ucwords {
    try {
      String str = this;

      if (str == null || str.trim() == '') return '';

      List<String> split = str.split(' ');
      for (int i = 0; i < split.length; i++) {
        if (split[i] != '') split[i] = split[i][0].toUpperCase() + split[i].substring(1);
      }

      return split.join(' ');
    } catch (e) {
      printCatch('$___sTrExtName@ucwords', e);
      return '';
    }
  }

  /// ``` dart
  /// print('lipsum99'.toNumber); // 99
  /// ```
  int get toNumber {
    try {
      if (this.isEmpty) return 0;

      return int.parse(this.replaceAll(new RegExp(r'[^0-9]'), ''));
    } catch (e) {
      printCatch('$___sTrExtName@toNumber', e);
      return 0;
    }
  }

  /// ``` dart
  /// print('9500'.idr()); // Rp 9.500
  /// print(9500.idr()); // Rp 9.500
  /// ```
  String idr({String symbol: 'Rp ', int decimal: 0}) {
    try {
      String str = this == null ? '0' : '$this';
      int number = str.isEmpty ? 0 : str.toNumber;
      return NumberFormat.currency(locale: 'id_ID', decimalDigits: decimal, symbol: symbol).format(number);
    } catch (e) {
      printCatch('$___sTrExtName@idr', e);
      return '$symbol 0';
    }
  }

  /// ``` dart
  /// print('Lorem Ipsum Dolor Sit', length: 3); // LID
  /// ```
  String charName({bool firstUppercase: true, int length: 2}) {
    String result = '';

    try {
      if (this != null) {
        List<String> char = this.split(' ');
        char.take(length).forEach((e) => result += firstUppercase ? e[0].ucwords : e[0]);
        return result;
      }

      return '';
    } catch (e) {
      printCatch('$___sTrExtName@charName', e);
      return '';
    }
  }

  /// ``` dart
  /// print('lorem ipsum dolor'.removeStringAfter('ipsum')); // lorem
  /// ```
  String removeStringAfter(String pattern) {
    return this == null ? '' : this.substring(0, this.indexOf(pattern));
  }

  /// ``` dart
  /// print('lorem ipsum dolor'.removeStringBefore('ipsum')); // dolor
  /// ```
  String removeStringBefore(String pattern) {
    return this == null ? '' : this.substring(this.lastIndexOf(pattern));
  }

  /// ``` dart
  /// print('<body>'.removeHtmlTag); // body
  /// ```
  String get removeHtmlTag {
    try {
      RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
      return '$this'.replaceAll(exp, '').replaceAll('&nbsp;', '');
    } catch (e) {
      printCatch('$___sTrExtName@removeHtmlTag', e);
      return '';
    }
  }

  /// Validasi password (huruf kapital, huruf kecil, angka)
  ///
  /// ``` dart
  /// print('passWORD1234'.isPasswordValid()); // true
  /// print('1234'.isPasswordValid()); // false
  /// ```
  bool isPasswordValid({bool capitalize: true, bool lowercase: true, bool number: true}) {
    List isValid = [];

    try {
      String cleanWhiteSpace(String s) => s.replaceAll(new RegExp(r"\s+"), "");
      String letterOnly = this.trim().replaceAll(new RegExp(r"([^a-zA-Z])"), "");

      List capitalizeValidation = cleanWhiteSpace(letterOnly).split('').map((e) => e == e.toUpperCase()).toList();
      List lowercasevalidation = cleanWhiteSpace(letterOnly).split('').map((e) => e == e.toLowerCase()).toList();

      if (capitalize) {
        isValid.add(capitalizeValidation.indexOf(true) > -1);
      }

      if (lowercase) {
        isValid.add(lowercasevalidation.indexOf(true) > -1);
      }

      bool isNumeric(String s) {
        // ignore: deprecated_member_use
        return s == null ? false : double.parse(s, (e) => null) != null;
      }

      if (number) {
        isValid.add(isNumeric(this.replaceAll(new RegExp(r'[^0-9]'), '')));
      }

      return isValid.indexOf(false) < 0;
    } catch (e) {
      printCatch('$___sTrExtName@isPasswordValid', e);
      return false;
    }
  }
}
