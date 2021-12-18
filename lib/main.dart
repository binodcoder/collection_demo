import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';

void main() => runApp(
      const MaterialApp(
        home: Scaffold(
          body: Test(),
        ),
      ),
    );

class Test extends StatefulWidget {
  const Test({Key key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  List _items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["data"]["Table1"];
    });

    var newMap = groupBy(_items, (obj) => obj['billdt']);

    print(newMap);
    newMap.forEach((key, value) {
      print(key);
      var sum = 0.0;
      value.forEach((element) {
        print(element['BillTot']);
        sum += element['BillTot'];
      });
      print("Total=$sum");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: readJson,
        child: const Text('call'),
      ),
    );
  }
}
