import 'fn.dart';

class Ansi {
  static orange(dynamic str) => print('\x1B[93m' + "$str" + '\x1B[0m');
}

p([dynamic o, bool runTime = false]) {
  String r = runTime ? '(${o.runtimeType})' : '';
  Ansi.orange(o ?? '-- ${Fn.lipsum()} $r');
}

printCatch(runtimeType, e, {String fn, bool viewMessage: false}) async {
  String fnName = fn ?? '';
  Ansi.orange('-- Catch error on $runtimeType$fnName, $e');

  if (viewMessage) {
    Fn.toast('Ops! Sepertinya terjadi kesalahan.');
  }
}
