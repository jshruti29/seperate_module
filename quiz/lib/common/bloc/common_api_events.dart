

import 'package:equatable/equatable.dart';

abstract class CommonApiEvents extends Equatable{}

// ignore: must_be_immutable
class FetchTestQuestionsEvent extends CommonApiEvents{

  final String testHash;

  FetchTestQuestionsEvent({required this.testHash});
  @override
  List<Object?> get props => throw UnimplementedError();
}

// ignore: must_be_immutable
class SubmitTestResultEvent extends CommonApiEvents{

 final String testHash;
 final String positiveMarks;
 final String negativeMarks;
 final String queString;

  SubmitTestResultEvent({required this.testHash,required this.positiveMarks,required this.negativeMarks,required this.queString});
  @override
  List<Object?> get props => throw UnimplementedError();
}

// ignore: must_be_immutable
class FetchTestResultEvent extends CommonApiEvents{

  final String testHash;
  final String totalQues;

  FetchTestResultEvent({required this.testHash,required this.totalQues});

  @override
  List<Object?> get props => throw UnimplementedError();
}

// ignore: must_be_immutable
class FetchTestDataHashEvent extends CommonApiEvents{

  final String dataHash;

  FetchTestDataHashEvent({required this.dataHash});
  @override
  List<Object?> get props => throw UnimplementedError();
}