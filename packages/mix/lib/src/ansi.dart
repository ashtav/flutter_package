import 'fn.dart';

class Ansi {
  static orange(dynamic str) => print('\x1B[93m' + "$str" + '\x1B[0m');
  static blue(dynamic str) => print('\x1B[34m' + "$str" + '\x1B[0m');
  static green(dynamic str) => print('\x1B[32m' + "$str" + '\x1B[0m');
  static red(dynamic str) => print('\x1B[31m' + "$str" + '\x1B[0m');
  static purple(dynamic str) => print('\x1B[35m' + "$str" + '\x1B[0m');
}

p([dynamic o]) {
  Ansi.orange(o ?? '-- Null');
}

printCatch(runtimeType, e, {String fn, bool viewMessage: false}) async {
  String fnName = fn ?? '';
  Ansi.orange('-- Catch error on $runtimeType$fnName, $e');

  if (viewMessage) {
    Fn.toast('Ops! Sepertinya terjadi kesalahan.');
  }
}
