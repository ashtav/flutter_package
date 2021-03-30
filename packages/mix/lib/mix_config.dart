import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class MixInit extends StatelessWidget {
  final Widget child;
  final Map<String, dynamic> config;

  MixInit({@required this.child, this.config});

  @override
  Widget build(BuildContext context) => GetBuilder(init: MixInitController(config: config), builder: (state) => child);
}

class MixInitController extends GetxController {
  final Map<String, dynamic> config;
  MixInitController({@required this.config});

  TextStyle font = TextStyle();

  Future init() async {
    try {
      font = config['font'];
    } catch (e) {}
  }

  @override
  void onReady() {
    super.onReady();
    init();
  }
}
