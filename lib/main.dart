import 'package:flutter/material.dart';
import 'package:quizapp/quuizlerbody.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(),
        body: QuizlerBody(),
      ),
    );
  }
}
