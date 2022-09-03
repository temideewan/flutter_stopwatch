import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:my_stopwatch_flutter/ui/stopwatch.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
    );
  }
}

class MyHomePage extends StatelessWidget {
 const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding:  EdgeInsets.all(32.0),
            child: AspectRatio(aspectRatio: 1, child: Stopwatch()),
          ),
        ),
      ),
    );
  }
}
