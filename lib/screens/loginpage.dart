import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'homepage.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({Key? key}) : super(key: key);

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  bool autoValidate = false;
  bool isLoading = false;

  login() async {
    setState(() {
      isLoading = true;
    });
    // await Future.delayed(Duration(seconds: 3));
    var url = "https://backendapilaravel-app.herokuapp.com/api/login";
    final response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json",
    }, body: {
      "email": emailController.text,
      "password": passwordController.text,
    });
    var res = json.decode(response.body);
    if (response.statusCode == 200) {
      if (res['user']['status'] == '1') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
    } else {
      print('email or password failed');
    }
  }

  check() {
    final form = _key.currentState;
    if (form!.validate()) {
      form.save();
      print(
          "email: ${emailController.text}, password: ${passwordController.text}");
      login();
    } else {
      setState(() {
        autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[100],
      body: Stack(
        children: [
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
            child: Center(
              child: Text(
                'Dev Webhozz',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15,
                  left: 10,
                  right: 10,
                ),
                child: Form(
                  key: _key,
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.cloud_done,
                              size: 40,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Presensi Digital',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 30,
                            ),
                            child: TextField(
                              controller: emailController,
                              // onSaved: (data) = = data!,
                              keyboardType: TextInputType.emailAddress,

                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 30,
                            ),
                            child: TextField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 30,
                                  top: 10,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    check();
                                  },
                                  child: Text('Login'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
