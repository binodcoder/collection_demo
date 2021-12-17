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
  const Test({Key? key}) : super(key: key);

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

    _items.forEach((m) {
      print(m["billdt"].split("T")[0]);
    });

    // for (var key in data.keys) {
    //   var sum = 0;
    //   var tot = data[key];

    //   tot!.forEach((element) {
    //     print(element);
    //     sum += element;
    //   });
    //   print("Total=$sum");
    //   print('..........');
    // }
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