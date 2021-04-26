import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mix/mix.dart';
import 'package:mix/mix_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MixInit(
        config: {'font': GoogleFonts.montserrat()},
        child: GetMaterialApp(
          title: 'Ashta Package',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Welcome(),
        ));
  }
}

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
          builder: (state) => Column(
                children: [
                  Container(
                    decoration: BoxDecoration(border: Br.only({'t': Br.side(C.black1)})),
                  ),
                  Text(MixShared.bulan[0]),
                  GestureDetector(
                    onTap: () {
                      Fn.goto('mailto: ');
                      print(434.idr());
                    },
                  )
                ],
              )),
    );
  }
}

// ref: https://www.youtube.com/watch?v=ZABb7PTkT58

// 1. create folder: mkdir packages
// 2. create package template: flutter create --template=package <your-package-name>