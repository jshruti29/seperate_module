




import 'package:equatable/equatable.dart';
import 'package:quiz/common/model/fetch_test_data_hash_model.dart';
import 'package:quiz/common/model/fetch_test_questions_model.dart';
import 'package:quiz/common/model/fetch_test_result_model.dart';
import 'package:quiz/common/model/submit_test_result_model.dart';

abstract class CommonApiStates extends Equatable {}

class CommonApiInitialState extends CommonApiStates{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class FetchTestQuestionsLoadingState extends CommonApiStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchTestQuestionsLoadedState extends CommonApiStates {
  final FetchTestQuestionsModel? fetchTestQuestionsModel;

  FetchTestQuestionsLoadedState({this.fetchTestQuestionsModel});
  @override
  // TODO: implement props
  List<Object?> get props => [fetchTestQuestionsModel];
}


class FetchTestQuestionsErrorState extends CommonApiStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class SubmitTestResultLoadingState extends CommonApiStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SubmitTestResultLoadedState extends CommonApiStates {
  final SubmitTestResultModel? submitTestResultModel;

  SubmitTestResultLoadedState({this.submitTestResultModel});
  @override
  // TODO: implement props
  List<Object?> get props => [submitTestResultModel];
}


class SubmitTestResultErrorState extends CommonApiStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class FetchTestResultLoadingState extends CommonApiStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchTestResultLoadedState extends CommonApiStates {
  final FetchTestResultModel? fetchTestResultModel;

  FetchTestResultLoadedState({this.fetchTestResultModel});
  @override
  // TODO: implement props
  List<Object?> get props => [fetchTestResultModel];
}


// ignore: must_be_immutable
class FetchTestResultErrorState extends CommonApiStates {
  String? message;

  FetchTestResultErrorState({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class FetchTestDataHashLoadingState extends CommonApiStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchTestDataHashLoadedState extends CommonApiStates {
  final FetchTestDataHashModel? fetchTestDataHashModel;

  FetchTestDataHashLoadedState({this.fetchTestDataHashModel});
  @override
  // TODO: implement props
  List<Object?> get props => [fetchTestDataHashModel];
}


class FetchTestDataHashErrorState extends CommonApiStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


