import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';

void main() => runApp(
      const MaterialApp(
        home: Test(),
      ),
    );

class Test extends StatefulWidget {
  const Test({Key key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  List _items = [];
  var newMap = {};

  @override
  void initState() {
    readJson();
    super.initState();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["data"]["Table1"];
    });

    newMap = groupBy(_items, (obj) => obj['billdt']);

    newMap.forEach((key, value) {
      print(key);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const SizedBox();
  }
}
