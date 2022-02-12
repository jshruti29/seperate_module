import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/home_module/bloc/home_screen_bloc.dart';
import 'package:quiz/home_module/bloc/home_screen_events.dart';
import 'package:quiz/home_module/repository/home_screen_repository.dart';
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
        home: BlocProvider(
            create: (context) => HomeScreenBloc(
                homeScreenRepository: HomeScreenRepositoryImpl()),
            child: HomeScreen()));
  }
}
