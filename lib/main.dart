import 'package:flutter/material.dart';
import 'package:gfmobile/UI/home.dart';

void main() => runApp(GetFlutter());

class GetFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Flutter UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GFUI(title: 'Get Flutter UI'),
      debugShowCheckedModeBanner: false,
    );
  }
}