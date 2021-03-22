import 'package:flutter_test/flutter_test.dart';

import 'package:mix/mix.dart';

void main() {
  test('adds one to input values', () {
    List list = [...MixShared.bulan.map((e) => e)];

    list[0] = 'po';
    print(list);
  });
}
