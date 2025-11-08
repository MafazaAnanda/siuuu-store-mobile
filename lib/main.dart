import 'package:flutter/material.dart';
import 'package:siuuu_store/screeens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIUUU STORE ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
        .copyWith(secondary: Colors.indigoAccent[400]),
      ),
      home: MyHomePage(),
    );
  }
}