import 'package:flutter/material.dart';
import 'package:presensi/screens/loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Color(0xFFFFC355),
      ),
      home: LoginPages(),
    );
  }
}
