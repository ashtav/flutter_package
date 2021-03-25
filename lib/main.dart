import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ashta Package',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Welcome(),
    );
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
      body: Column(
        children: [
          Container(
            color: C.red,
          ),
          Text(MixShared.bulan[0]),
          GestureDetector(
            onTap: () {
              Fn.goto('mailto: ');
            },
          )
        ],
      ),
    );
  }
}

// ref: https://www.youtube.com/watch?v=ZABb7PTkT58

// 1. create folder: mkdir packages
// 2. create package template: flutter create --template=package <your-package-name>