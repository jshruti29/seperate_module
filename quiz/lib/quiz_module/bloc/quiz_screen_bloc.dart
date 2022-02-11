// import 'package:career_lift_mobile_app/screens/quiz_module/bloc/quiz_screen_events.dart';
// import 'package:career_lift_mobile_app/screens/quiz_module/bloc/quiz_screen_states.dart';
// import 'package:career_lift_mobile_app/screens/quiz_module/repository/quiz_screen_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/quiz_module/bloc/quiz_screen_events.dart';
import 'package:quiz/quiz_module/bloc/quiz_screen_states.dart';

import '../repository/quiz_screen_repository.dart';

class QuizScreenBloc extends Bloc<QuizScreenEvents, QuizScreenStates> {
  QuizScreenRepository quizScreenRepository;
  QuizScreenBloc({required this.quizScreenRepository})
      : super(QuizScreenInitialState());

  QuizScreenStates get initialState => QuizScreenInitialState();

  @override
  Stream<QuizScreenStates> mapEventToState(QuizScreenEvents event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
