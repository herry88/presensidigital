import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:presensi/model/usermodel.dart';
import 'package:presensi/screens/createpage.dart';
import 'package:presensi/screens/detailpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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

  //getProduct
  Future<List>? getData() async {
    final response = await http.get(
      Uri.parse("https://backendapilaravel-app.herokuapp.com/api/product"),
    );
    // print(response.body)['data'];
    return json.decode(response.body)['data'];
  }

  @override
  void initState() {
    getPref();
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ItemList(list: snapshot.data)
              : Center(
                  child: Text("Loading Terus ..."),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatePage(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.orangeAccent,
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  List? list;

  ItemList({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    list: list,
                    index: index,
                  ),
                ),
              );
            },
            child: Card(
              child: ListTile(
                title: Text(list![index]['nmproduct']),
              ),
            ),
          );
        });
  }
}
