import 'package:flutter/material.dart';
import 'package:assignement1/utilities/student.dart';

class StudentEntryScreen extends StatefulWidget {
  StudentEntryScreen({Key? key}) : super(key: key);

  @override
  State<StudentEntryScreen> createState() => _StudentEntryScreenState();
}

class _StudentEntryScreenState extends State<StudentEntryScreen> {
  String? batch;
  late String name;

  late int api, android, iot;

  List<String> items = ['28 B', '28 A'];

  final _globalkey = GlobalKey<FormState>();

  List<Students> studentresultlist = [];

  addStudent(Students student) {
    setState(() {
      setState(() {
        studentresultlist.add(student);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Student Registration"),
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _globalkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  onChanged: (value) => {
                    if (value != "") {name = value.toString()}
                  },
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "NAME",
                    hintText: "NAME",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "The input box is empty";
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 9.0, vertical: 4.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: DropdownButton(
                            hint: const Text('select batch:'),
                            dropdownColor:
                                const Color.fromARGB(255, 246, 243, 243),
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
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  onChanged: (value) => {
                    if (value != "") {api = int.parse(value)}
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "API MARKS",
                    hintText: "API MARKS",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "The input box is empty";
                    }
                    return null;
                  },
                ),

                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  onChanged: (value) => {
                    if (value != "") {android = int.parse(value)}
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "ANDROID MARKS",
                    hintText: "ANDROID MARKS",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "The input box is empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  onChanged: (value) => {
                    if (value != "") {iot = int.parse(value)}
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "IOT MARKS",
                    hintText: "IOT MARKS",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "The input box is empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                // TextFormField(
                //   onChanged: (value) => {
                //     if (value != "") {batch = value} else {batch = 'new'}
                //   },
                //   keyboardType: TextInputType.number,
                //   decoration: const InputDecoration(
                //     labelText: "BATCH",
                //     hintText: "BATCH",
                //     border: OutlineInputBorder(),
                //   ),
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return "The input box is empty";
                //     }
                //     return null;
                //   },
                // ),
                const SizedBox(
                  height: 8,
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_globalkey.currentState!.validate()) {
                        setState(() {
                          Students student = Students(
                            name: name,
                            api: api,
                            android: android,
                            iot: iot,
                            answer: ((iot + api + android) / 300 * 100).round(),
                            batch: batch!,
                            resulttype: (iot < 40 && api < 40 && android < 40)
                                ? "Fail"
                                : "Pass",
                          );
                          addStudent(student);
                          print(studentresultlist.length);
                        });
                      }
                    },
                    child: const Text("Add Marks"),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/resultScreen',
                          arguments: studentresultlist);
                    },
                    child: const Text("view Result"),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
