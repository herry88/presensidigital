import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text('Simpan Data'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
