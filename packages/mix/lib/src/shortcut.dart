import 'package:flutter/material.dart';

// COLORS

class C {
  static const transparent = Colors.transparent;
  static const white = Colors.white;
  static const black = Color(0xff181A18);
  static const red = Color(0xffff6961);
  static const blue = Color(0xff0275d8);
  static const green = Color(0xff77dd77);
  static const orange = Color(0xffffa500);
  static const cyan = Color(0xffadd8e6);
  static const yellow = Colors.yellow;

  /// eg: `C.hex('f5f5f5')`
  static hex(String code) => Color(int.parse('0xff$code'));
}

// BORDER

class Br {
  static radius(double value) => BorderRadius.circular(value);
}

// BorderSide

class Bs {
  static color(Color color, {double width: 1, BorderStyle style: BorderStyle.solid}) => BorderSide(color: color, width: width, style: style);
}

// EdgeInsets

class Ei {
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
