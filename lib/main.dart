import 'package:flutter/material.dart';
import 'package:presensi/screens/loginpage.dart';
import 'package:presensi/screens/tabbarpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? email = pref.getString('email');
  print(email);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String? email;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Color(0xFFFFC355),
      ),
      home: email == null ?  LoginPages() : TabbarPage()
    );
  }
}
