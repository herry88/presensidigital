import 'package:flutter/material.dart';

import 'pages/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'presensi demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPages(),
    );
  }
}