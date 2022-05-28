import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:presensi/helper/databasehelper.dart';
import 'package:presensi/screens/homepage.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  //panggil functionya dulu
  DatabaseHelper databaseHelper = DatabaseHelper();

  //deklarasi form
  TextEditingController nmproduct = TextEditingController();
  TextEditingController stock = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Create Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.only(
              top: 20.0, left: 12.0, right: 12.0, bottom: 12.0),
          children: [
            Container(
              height: 50.0,
              child: TextField(
                controller: nmproduct,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nama Product',
                  hintText: 'Nama Produk',
                  icon: const Icon(
                    Ionicons.add_circle,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              height: 50.0,
              child: TextField(
                controller: stock,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Stock',
                  hintText: 'Stock',
                  icon: const Icon(
                    Ionicons.settings_outline,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
            ),
            Container(
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  //function create
                  databaseHelper.addData(
                    nmproduct.text.trim(),
                    stock.text.trim(),
                  );
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>const HomePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Simpan Data',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
