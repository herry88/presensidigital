import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:presensi/helper/databasehelper.dart';
import 'package:presensi/screens/editpage.dart';
import 'package:presensi/screens/homepage.dart';

class DetailPage extends StatefulWidget {
  List? list;
  int index;
  DetailPage({Key? key, this.list, required this.index}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //function delte
  DatabaseHelper dbHelper = DatabaseHelper();

  //confirm
  void confirm(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Confirm"),
            content: const Text("Are you sure want to delete this data?"),
            actions: <Widget>[
              TextButton(
                child: const Text("Yes"),
                onPressed: () {
                  dbHelper.deleteData(widget.list![widget.index]['id']);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
              TextButton(
                child: const Text("No"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.list![widget.index]['nmproduct'],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Card(
            elevation: 5.0,
            margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Nama Produk : ${widget.list![widget.index]['nmproduct']}",
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Harga Produk : ${widget.list![widget.index]['stock']}",
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          //edit data
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditPage(
                                list: widget.list,
                                index: widget.index,
                              ),
                            ),
                          );
                        },
                        child: Text('Edit Data'),
                      ),
                      const SizedBox(width: 10.0),
                      ElevatedButton(
                          onPressed: () {
                            confirm(context);
                            // print('DeleteKLIK');
                          },
                          child: Text('Delete Data'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
