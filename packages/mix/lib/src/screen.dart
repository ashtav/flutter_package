import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen {
  static width(context) => MediaQuery.of(context).size.width;
  static height(context) => MediaQuery.of(context).size.height;
  static statusBar(context) => MediaQuery.of(context).padding.top;

  static back([length]) => List.generate(length ?? 1, (i) => Get.back());

  /// ``` dart
  /// Screen.to(PageName());
  /// ```
  static to(Widget widget, {BuildContext context, Function(dynamic value) then}) {
    Navigator.push(context ?? Get.overlayContext, MaterialPageRoute(builder: (context) => widget)).then((value) {
      if (then != null) then(value);
    });
  }
}
