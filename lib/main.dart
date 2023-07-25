import 'package:flutter/material.dart';
import 'package:untitled/layout/home_layout.dart';

// import 'package:untitled/modules/bmi/bmi_screen.dart';
// import 'package:untitled/modules/login/login_screen.dart';
// import 'bmi_result_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}
