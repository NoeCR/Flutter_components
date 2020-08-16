import 'package:flutter/material.dart';
import 'package:flutter_components_01/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components APP',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
