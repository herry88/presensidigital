import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:presensidigital/widgets/button.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({Key? key}) : super(key: key);

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  //key pada form
  final _key = GlobalKey<FormState>();

  //variabel untuk menampung inputan
  late String email, password;

  bool autoValidate = false;
  bool isLoading = false;

  //function cek form
  check() {
    final form = _key.currentState;
    if (form!.validate()) {
      login();
      print('email: $email, password: $password');
    } else {
      setState(() {
        autoValidate = true;
      });
    }
  }

  //functionlogin
  login() async {
    setState(() {
      isLoading = true;
    });
    var url = "http://192.168.100.90:8001/api/login";

    final response = await http.post(Uri.parse(url), body: {
      'email': '$email'.toString(),
      'password': '$password'.toString()
    });
    var res = jsonDecode(response.body);
    print(res);
    setState(() {
      isLoading = false;
    });
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      print(res['msg']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[100],
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.8,
            ),
            child: const Center(
              child: Text(
                'presensi Demo',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15,
                  left: 10.0,
                  right: 10.0,
                ),
                child: Form(
                  key: _key,
                  child: Card(
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        bottomRight: Radius.circular(50.0),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 40.0),
                      child: Column(
                        children: [
                          Container(
                            child: const Icon(
                              Icons.cloud_done,
                              color: Colors.white,
                              size: 40.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                12.0,
                              ),
                              color: Colors.amber,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const Text(
                            'Presensi Digital',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 30.0,
                            ),
                            child: TextFormField(
                              onSaved: (data) => email = data!,
                              autovalidateMode: autoValidate
                                  ? AutovalidateMode.always
                                  : AutovalidateMode.disabled,
                              validator: (input) {
                                if (input!.isEmpty) {
                                  return 'Email tidak boleh kosong';
                                }
                                if (!input.contains('@')) {
                                  return 'Email tidak valid';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Email',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 30.0,
                            ),
                            child: TextFormField(
                              onSaved: (data) => password = data!,
                              autovalidateMode: autoValidate
                                  ? AutovalidateMode.always
                                  : AutovalidateMode.disabled,
                              validator: (input) {
                                if (input!.isEmpty) {
                                  return 'Password tidak boleh kosong';
                                }
                                if (input.length < 8) {
                                  return 'Password minimal 8 karakter';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 30.0,
                                  top: 10.0,
                                ),
                                child: ButtonWidget(
                                  onpressed: () {
                                    //check function
                                    check();
                                  },
                                  title: 'Login',
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: isLoading
                ? Column(
                    children: [
                      CircularProgressIndicator(),
                      Text(
                        "Mohon Tunggu ...",
                        style: TextStyle(color: Colors.amber),
                      ),
                    ],
                  )
                : SizedBox(
                    height: 0,
                  ),
          ),
        ],
      ),
    );
  }
}
