import 'package:flutter/material.dart';
import 'package:assignement1/utilities/student.dart';

import '../utilities/student.dart';

class ResultPage extends StatefulWidget {
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String? batch;
  String? resultvalue;

  List<String> items = ['28 B', '28 A'];
  @override
  Widget build(BuildContext context) {
    List<Students> results =
        ModalRoute.of(context)!.settings.arguments as List<Students>;
    List<Students> fliterlist =
        results.where((i) => i.batch.contains('$resultvalue')).toList();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Result',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(
              height: 29.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 9.0, vertical: 9.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: DropdownButton(
                hint: const Text('select batch:'),
                dropdownColor: const Color.fromARGB(255, 246, 243, 243),
                icon: const Icon(Icons.arrow_drop_down),
                isExpanded: true,
                iconSize: 36,
                value: batch,
                onChanged: (dynamic newValue) {
                  setState(() {
                    batch = newValue;
                  });
                },
                items: items.map(
                  (String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  },
                ).toList(),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    resultvalue = batch;
                  });
                },
                child: const Text("view Result"),
              ),
            ),
            SingleChildScrollView(
              child: DataTable(
                  columns: const [
                    DataColumn(label: Text('name')),
                    DataColumn(label: Text('percentage')),
                    DataColumn(label: Text('batch')),
                    DataColumn(label: Text('result')),
                  ],
                  rows: fliterlist
                      .map(
                        (student) => DataRow(
                          selected: true,
                          cells: [
                            DataCell(
                              Text(student.name),
                            ),
                            DataCell(
                              Text('${student.answer.toString()} %'),
                            ),
                            DataCell(
                              Text(student.batch),
                            ),
                            DataCell(
                              Text('${student.resulttype}'),
                            ),

                            // DataCell(
                            //   IconButton(
                            //     icon: const Icon(Icons.delete),
                            //     onPressed: () {
                            //       setState(
                            //         () {
                            //           fliterlist.remove(student);
                            //         },
                            //       );
                            //     },
                            //   ),
                            // ),
                          ],
                        ),
                      )
                      .toList()),
            ),
          ]),
        ),
      ),
    );
  }
}
