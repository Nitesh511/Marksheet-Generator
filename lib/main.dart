import 'package:flutter/material.dart';
// import 'package:marksheetgenerator/screens/input_page.dart';
// import 'package:marksheetgenerator/screens/viewresult_page.dart';
import 'package:assignement1/screens/input_page.dart';
import 'package:assignement1/screens/viewresult_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': ((context) => StudentEntryScreen()),
      '/resultScreen': ((context) => ResultPage())
    },
  ));
}
