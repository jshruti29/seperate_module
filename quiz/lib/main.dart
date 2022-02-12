import 'package:flutter/material.dart';
import 'package:quiz/home_module/bloc/home_screen_events.dart';
import 'package:quiz/home_module/screens/mobile/home_screen.dart';
import 'package:quiz/quiz_module/screens/mobile/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
