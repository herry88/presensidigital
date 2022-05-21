import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailPage extends StatefulWidget {
  List? list;
  int index;
  DetailPage({Key? key, this.list, required this.index}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //function delte
  void deleteData() async {
    
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
                children: [
                  Text(
                    "Nama Produk : ${widget.list![widget.index]['nmproduct']}",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Stock : ${widget.list![widget.index]['stock']}",
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Edit Data'),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        child: Text("Delete"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
