import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:mix/src/shared/shared.dart';
import 'package:get/get.dart';
import 'package:lipsum/lipsum.dart';

import 'package:url_launcher/url_launcher.dart';

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

  /// eg: `Fn.statusBar(color: Colors.transparent, darkText: true)`
  static statusBar({Color color, bool darkText: true}) async {
    await FlutterStatusbarcolor.setStatusBarColor(color ?? Colors.transparent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(!darkText);
  }

  /// eg: `Fn.goto('tel: 0810...')` or `Fn.goto('mailto: lipsum@gmail.com')` or `Fn.goto('https://google.com')`
  static goto(String url) async => await launch(url);

  /// eg: `Fn.openMap(-8.667138922071201, 115.21679636919626)` -> Denpasar City
  static openMap(latitude, longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) await launch(googleUrl);
  }

  /// ```dart
  /// Timer timer = Fn.timer((){
  ///   // do something...
  /// }, 100);
  /// ```
  static timer(Function then, [int ms]) => Timer(Duration(milliseconds: ms ?? 50), then);

  /// ```dart
  /// Fn.toast('Lorem ipsum dolor sit');
  /// ```
  static toast(String text,
      {String position: 'bottom', double fontSize: 14.0, Color textColor: Colors.white, Color background: const Color.fromRGBO(0, 0, 0, .7)}) {
    Map _mapPos = {
      'top': ToastGravity.TOP,
      'topLeft': ToastGravity.TOP_LEFT,
      'topRight': ToastGravity.TOP_RIGHT,
      'bottom': ToastGravity.BOTTOM,
      'bottomLeft': ToastGravity.BOTTOM_LEFT,
      'bottomRight': ToastGravity.BOTTOM_RIGHT,
      'centerLeft': ToastGravity.CENTER_LEFT,
      'centerRight': ToastGravity.CENTER_RIGHT,
      'sbackbar': ToastGravity.SNACKBAR,
    };

    return Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: _mapPos[position] ?? ToastGravity.BOTTOM,
        backgroundColor: background,
        textColor: textColor,
        fontSize: fontSize);
  }

  /// hapus key atau property dari `Map` jika key atau property tersebut bernilai eg: `[null, '']`
  ///
  /// secara default, fungsi ini akan menghapus `Map` yang memiliki key dengan nilai `null`
  ///
  /// ```dart
  /// Fn.removeKeyFromMap({}, withValue: [null, ''])
  /// ```
  static removeKeyFromMap(Map map, {List withValue: const [null]}) {
    map.keys.where((k) => withValue.contains(map[k])).toList().forEach(map.remove);
  }

  /// fungsi ini akan memindahkan cursor yang aktif pada `TextField` ke akhir teks
  ///
  /// ```dart
  /// var name = TextEditingController();
  /// Fn.cursorToLastPosition(name);
  /// ```
  static cursorToLastPosition(TextEditingController controller, [int time]) {
    Timer(Duration(milliseconds: time ?? 50), () => controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length)));
  }

  /// ```dart
  /// String timeElapsed = Fn.timeElapsed('2021-02-24 11:12:30');
  /// ```
  static String timeElapsed(String dateString, {bool returnAsDate: false}) {
    try {
      Duration compare(DateTime x, DateTime y) => Duration(microseconds: (x.microsecondsSinceEpoch - y.microsecondsSinceEpoch).abs());

      DateTime date = DateTime.parse(dateString);

      DateTime x = DateTime.now();
      DateTime y = DateTime(date.year, date.month, date.day, date.hour, date.minute, date.second);

      Duration diff = compare(x, y);
      String h = '${date.hour}'.padLeft(2, '0'), m = '${date.minute}'.padLeft(2, '0'), s = '${date.second}'.padLeft(2, '0');

      String _dateTime = '${date.year}' + '-' + '${date.month}'.padLeft(2, '0') + '-' + '${date.day}'.padLeft(2, '0') + (' $h:$m:$s');

      // jika waktu yang diset (dateString) lebih dari waktu saat ini
      if (y.millisecondsSinceEpoch > x.millisecondsSinceEpoch) {
        return '-';
      }

      if (diff.inSeconds >= 60) {
        if (diff.inMinutes >= 60) {
          if (diff.inHours >= 24) {
            return diff.inDays > 31
                ? _dateTime
                : returnAsDate
                    ? _dateTime
                    : '${diff.inDays} hari yang lalu';
          } else {
            return returnAsDate ? _dateTime : '${diff.inHours} jam yang lalu';
          }
        } else {
          return returnAsDate ? _dateTime : '${diff.inMinutes} menit yang lalu';
        }
      } else {
        return 'baru saja';
      }
    } catch (e) {
      throw e;
    }
  }

  /// ```dart
  /// String text = Fn.lipsum(5);
  /// ```
  static String lipsum([int numWords]) => createWord(numWords: numWords ?? 5);
}
