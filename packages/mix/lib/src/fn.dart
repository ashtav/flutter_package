import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mix/src/shared/shared.dart';
import 'package:get/get.dart';

/*

  Daftar fungsi dalam class Fn

  1.  Fn.now(format: 'D, d F Y h:i:s')
      Get waktu sekarang dengan format yang kita inginkan

*/

_mapDateTimeFormat(DateTime dateTime, List months, List days) => {
      'd': '${dateTime.day}'.padLeft(2, '0'),
      'm': '${dateTime.month}'.padLeft(2, '0'),
      'Y': '${dateTime.year}',
      'h': '${dateTime.hour}'.padLeft(2, '0'),
      'i': '${dateTime.minute}'.padLeft(2, '0'),
      's': '${dateTime.second}'.padLeft(2, '0'),
      'F': '${months[dateTime.month - 1]}',
      'M': '${months[dateTime.month - 1]}'.substring(0, 3),
      'D': '${days[dateTime.weekday - 1]}'
    };

class Fn {
  mapDateFormat(DateTime dateTime, List months, List days) => {
        'd': '${dateTime.day}'.padLeft(2, '0'),
        'm': '${dateTime.month}'.padLeft(2, '0'),
        'Y': '${dateTime.year}',
        'h': '${dateTime.hour}'.padLeft(2, '0'),
        'i': '${dateTime.minute}'.padLeft(2, '0'),
        's': '${dateTime.second}'.padLeft(2, '0'),
        'F': '${months[dateTime.month - 1]}',
        'M': '${months[dateTime.month - 1]}'.substring(0, 3),
        'D': '${days[dateTime.weekday - 1]}'
      };

  /// eg: `Fn.now(format: 'D, d F Y h:i:s') -> Kamis, 28 Januari 2021 10:29:59)`
  static String now({String format: 'd-m-Y'}) {
    DateTime now = DateTime.now();

    try {
      String result = '';

      List months = MixShared.bulan, days = MixShared.hari;

      Map<String, dynamic> map = _mapDateTimeFormat(now, months, days);

      '$format'.split('').forEach((e) => map.containsKey(e) ? result += map[e] : result += e);

      return result;
    } catch (e) {
      throw e;
    }
  }

  /// eg: `Fn.dateFormat(DateTime.parse('2021-03-20'), format: 'D, d F Y h:i:s') -> Sabtu, 20 Maret 2021)`
  static String dateFormat(DateTime dateTime, {String format: 'd-m-Y'}) {
    try {
      String result = '';
      List months = MixShared.bulan, days = MixShared.hari;

      Map<String, dynamic> map = _mapDateTimeFormat(dateTime, months, days);

      '$format'.split('').forEach((e) => map.containsKey(e) ? result += map[e] : result += e);

      return result;
    } catch (e) {
      throw e;
    }
  }

  /// eg: `Fn.focus(emailNode)` -> Set fokus pada textfield
  static focus(FocusNode nodeName, {BuildContext context}) => FocusScope.of(context ?? Get.overlayContext).requestFocus(nodeName);

  /// eg: `Fn.unfocus()` -> Matikan fokus semua textfield
  static unfocus() => FocusScope.of(Get.overlayContext).requestFocus(FocusNode());

  /// eg: `Fn.doubleInRange(10, 100)`
  static double doubleInRange(num start, num end) => Random().nextDouble() * (end - start) + start;

  /// eg: `Fn.intInRange(100)`
  static int intInRange(num max) => Random().nextInt(max);
}
