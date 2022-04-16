import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:presensi/model/postmodel.dart';
import 'package:presensi/model/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final User? user;
  const HomePage({Key? key, this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? email;
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      email = pref.getString('email');
      print(email);
    });
  }

  @override
  void initState() {
    getPref();
    getPostByUser();
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      
    ));
  }
}
