import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  List? list;
  int index;
  EditPage({Key? key, this.list, required this.index}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {}
}
