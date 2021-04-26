import 'package:flutter/material.dart';

// COLORS

class C {
  static const none = Colors.transparent;
  static const white = Colors.white;
  static const red = Color(0xffff6961);
  static const blue = Color(0xff0275d8);
  static const green = Color(0xff77dd77);
  static const orange = Color(0xffffa500);
  static const cyan = Color(0xffadd8e6);
  static const yellow = Colors.yellow;

  static const black = Color(0xff181A18);
  static const black1 = Color(0xffF1F1F1);
  static const black2 = Color(0xffD4D4D4);
  static const black3 = Color(0xffB9B9B9);
  static const black4 = Color(0xff9E9E9E);
  static const black5 = Color(0xff848484);
  static const black6 = Color(0xff6B6B6B);
  static const black7 = Color(0xff525252);
  static const black8 = Color(0xff3B3B3B);
  static const black9 = Color(0xff262626);

  /// eg: `C.hex('f5f5f5')`
  static hex(String code) => Color(int.parse('0xff$code'));
}

// BORDER

class Br {
  /// ``` dart
  /// border: Br.all(C.black2)
  /// ```
  static BoxBorder all(Color color, {double width: 1, BorderStyle style: BorderStyle.solid}) => Border.all(color: color, width: width, style: style);

  /// ``` dart
  /// border: Br.only({'t': Br.side(C.black)})
  /// ```
  static BoxBorder only(Map<String, BorderSide> map, {Color color}) => Border(
      top: map['t'] ?? BorderSide.none, bottom: map['b'] ?? BorderSide.none, left: map['l'] ?? BorderSide.none, right: map['r'] ?? BorderSide.none);

  /// ``` dart
  /// border: Br.except(['t'])
  /// ```
  static BoxBorder except([List<String> except, Color color]) => Border(
      top: except.contains('t') ? BorderSide.none : Br.side(color ?? C.black1),
      bottom: except.contains('b') ? BorderSide.none : Br.side(color ?? C.black1),
      left: except.contains('l') ? BorderSide.none : Br.side(color ?? C.black1),
      right: except.contains('r') ? BorderSide.none : Br.side(color ?? C.black1));

  /// ``` dart
  /// borderRadius: Br.radius(15)
  /// ```
  static BorderRadius radius(double value) => BorderRadius.circular(value);

  /// ``` dart
  /// Border(left: Br.side(C.black1))
  /// ```
  static BorderSide side(Color color, {double width: 1, BorderStyle style: BorderStyle.solid}) =>
      BorderSide(color: color, width: width, style: style);

  /// ``` dart
  /// borderRadius: Br.radOnly({'tl': 15, 'tr': 15})
  /// ```
  static BorderRadiusGeometry radOnly(Map<String, double> map) => BorderRadius.only(
      topLeft: Radius.circular(map['tl'] ?? 0),
      topRight: Radius.circular(map['tr'] ?? 0),
      bottomLeft: Radius.circular(map['bl'] ?? 0),
      bottomRight: Radius.circular(map['br'] ?? 0));

  /// ``` dart
  /// borderRadius: Br.circle
  /// ```
  static final circle = BorderRadius.circular(99999);
}

// EdgeInsets

class Ei {
  static const none = EdgeInsets.all(0);

  static only({double b, double t, double l, double r}) => EdgeInsets.only(bottom: b ?? 0, top: t ?? 0, left: l ?? 0, right: r ?? 0);

  static all(double value) => EdgeInsets.all(value ?? 0);

  static sym({double v, double h}) => EdgeInsets.symmetric(vertical: v ?? 0, horizontal: h ?? 0);
}

// MainAxisSize

class Mas {
  static const max = MainAxisSize.max;
  static const min = MainAxisSize.min;
}

// MainAxisAlignment

class Maa {
  static const start = MainAxisAlignment.start;
  static const center = MainAxisAlignment.center;
  static const end = MainAxisAlignment.end;
  static const spaceAround = MainAxisAlignment.spaceAround;
  static const spaceBetween = MainAxisAlignment.spaceBetween;
  static const spaceEvenly = MainAxisAlignment.spaceEvenly;
}

// CrossAxisAlignment

class Caa {
  static const start = CrossAxisAlignment.start;
  static const center = CrossAxisAlignment.center;
  static const end = CrossAxisAlignment.end;
  static const baseline = CrossAxisAlignment.baseline;
  static const stretch = CrossAxisAlignment.stretch;
}

// TextAlign

class Ta {
  static const start = TextAlign.start;
  static const left = TextAlign.left;
  static const right = TextAlign.right;
  static const end = TextAlign.end;
  static const justify = TextAlign.justify;
  static const center = TextAlign.center;
}

// TextOverflow

class Tof {
  static const clip = TextOverflow.clip;
  static const ellipsis = TextOverflow.ellipsis;
  static const fade = TextOverflow.fade;
  static const visible = TextOverflow.visible;
}

// FontWeight

class Fw {
  static const normal = FontWeight.normal;
  static const bold = FontWeight.bold;
  static const w100 = FontWeight.w100;
  static const w200 = FontWeight.w200;
  static const w300 = FontWeight.w300;
  static const w400 = FontWeight.w400;
  static const w500 = FontWeight.w500;
  static const w600 = FontWeight.w600;
  static const w700 = FontWeight.w700;
  static const w800 = FontWeight.w800;
  static const w900 = FontWeight.w900;
}
