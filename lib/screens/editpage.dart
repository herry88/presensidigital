import 'package:flutter/material.dart';
import 'package:presensi/helper/databasehelper.dart';
import 'package:presensi/screens/tabbarpage.dart';

class EditPage extends StatefulWidget {
  List? list;
  int index;
  EditPage({Key? key, this.list, required this.index}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  //function edit
  DatabaseHelper dbHelper = DatabaseHelper();

  TextEditingController nmproduct = TextEditingController();
  TextEditingController stock = TextEditingController();

  @override
  void initState() {
    nmproduct =
        TextEditingController(text: widget.list![widget.index]['nmproduct']);
    stock = TextEditingController(text: widget.list![widget.index]['stock']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.list![widget.index]['nmproduct'],
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 50.0,
              child: TextField(
                controller: nmproduct,
                decoration: InputDecoration(
                  labelText: 'Nama Produk',
                  hintText: 'Nama Produk',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 50.0,
              child: TextField(
                controller: stock,
                decoration: InputDecoration(
                  labelText: 'Stock',
                  hintText: 'Stock',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  //edit Data
                  dbHelper.editData(
                    widget.list![widget.index]['id'],
                    nmproduct.text.trim(),
                    stock.text.trim(),
                  );
                  //redirect
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => TabbarPage(),
                    ),
                  );
                },
                child: Text('Edit Data'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
