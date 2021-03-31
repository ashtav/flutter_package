import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  test('adds one to input values', () {
    print('\x1B[93m' + "Hello" + '\x1B[0m');
    print('\x1B[34m' + "Blue" + '\x1B[0m');
    print('\x1B[32m' + "Green" + '\x1B[0m');
    print('\x1B[31m' + "Red" + '\x1B[0m');
    print('\x1B[35m' + "Purple" + '\x1B[0m');

    print(MixShared.bulan.map((e) => e.substring(0, 3)).toList());
  });
}
