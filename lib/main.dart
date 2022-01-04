import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:demo/strings.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

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
    return SizedBox();
  }

  // @override
  // Widget build(BuildContext context) {
  //   List c = <Widget>[];
  //   var totalSum = 0.0;

  //   newMap.forEach((key, value) {
  //     var groupSum = 0.0;

  //     c.add(Container(
  //       margin: const EdgeInsets.only(top: 10, bottom: 10),
  //       child: Text(
  //         key,
  //         style: const TextStyle(
  //           fontSize: 16,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ));

  //     c.add(Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: const [
  //         Text(
  //           'Guest Name',
  //           style: TextStyle(fontWeight: FontWeight.bold),
  //         ),
  //         Text(
  //           'Amount',
  //           style: TextStyle(fontWeight: FontWeight.bold),
  //         ),
  //       ],
  //     ));
  //     c.add(const Padding(padding: EdgeInsets.only(bottom: 10)));
  //     value.forEach((element) {
  //       groupSum += element['BillTot'];
  //       totalSum += element['BillTot'];
  //       c.add(Column(
  //         children: <Widget>[
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(element['GName'] ?? '-'),
  //               Text(element['BillTot'].toStringAsFixed(2)),
  //             ],
  //           ),
  //           const Divider(
  //             color: Colors.black,
  //             height: 15.0,
  //           ),
  //         ],
  //       ));
  //     });
  //     c.add(Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         const Text(
  //           'Total',
  //           style: TextStyle(fontWeight: FontWeight.bold),
  //         ),
  //         Text(
  //           groupSum.toStringAsFixed(2),
  //           style: const TextStyle(fontWeight: FontWeight.bold),
  //         ),
  //       ],
  //     ));
  //     c.add(const Divider(
  //       color: Colors.black,
  //       height: 15.0,
  //       thickness: 2,
  //     ));
  //   });

  //   return Scaffold(
  //       appBar: AppBar(
  //         title: const Text("Room Sales"),
  //       ),
  //       bottomNavigationBar: BottomNavigationBar(
  //         currentIndex: 0,
  //         type: BottomNavigationBarType.fixed,
  //         unselectedItemColor: Colors.yellowAccent,
  //         selectedItemColor: Colors.yellowAccent,
  //         unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
  //         selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
  //         backgroundColor: Colors.blueGrey[900],
  //         items: <BottomNavigationBarItem>[
  //           const BottomNavigationBarItem(
  //             icon: Icon(
  //               Icons.calculate,
  //               color: Colors.yellowAccent,
  //             ),
  //             label: "Total",
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Text(
  //               totalSum.toStringAsFixed(2),
  //               style: const TextStyle(
  //                 color: Colors.yellowAccent,
  //                 fontSize: 16,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             label: 'Room Sales',
  //           ),
  //         ],
  //       ),
  //       body: SingleChildScrollView(
  //           scrollDirection: Axis.horizontal,
  //           child: SizedBox(
  //             height: double.infinity,
  //             width: 500,
  //             child: ListView.builder(
  //                 itemCount: c.length,
  //                 itemBuilder: (BuildContext context, int index) {
  //                   return Column(
  //                     children: c,
  //                   );
  //                 }),
  //           )));
  // }
}
