import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/common/bloc/common_api_events.dart';
import 'package:quiz/common/bloc/common_api_states.dart';
import 'package:quiz/common/database/my_store.dart';
import 'package:quiz/common/model/fetch_test_data_hash_model.dart';
import 'package:quiz/common/model/fetch_test_questions_model.dart';
import 'package:quiz/common/model/fetch_test_result_model.dart';
import 'package:quiz/common/model/submit_test_result_model.dart';
import 'package:quiz/common/repository/common_api_repository.dart';
import 'package:velocity_x/velocity_x.dart';

class CommonApiBloc extends Bloc<CommonApiEvents, CommonApiStates> {
  CommonApiRepository commonApiRepository;
  MyStore store = VxState.store;

  CommonApiBloc({required this.commonApiRepository})
      : super(CommonApiInitialState());

  CommonApiStates get initialState => CommonApiInitialState();

  @override
  Stream<CommonApiStates> mapEventToState(CommonApiEvents event) async* {
    if (event is FetchTestQuestionsEvent) {
      yield FetchTestQuestionsLoadingState();
      try {
        FetchTestQuestionsModel fetchTestQuestionsModel =
            await commonApiRepository.fetchTestQuestions(event.testHash);
        yield FetchTestQuestionsLoadedState(
            fetchTestQuestionsModel: fetchTestQuestionsModel);
      } catch (e) {
        yield FetchTestQuestionsErrorState();
      }
    }
    if (event is SubmitTestResultEvent) {
      yield SubmitTestResultLoadingState();
      try {
        SubmitTestResultModel submitTestResultModel =
            await commonApiRepository.submitTestResult(event.testHash,
                event.positiveMarks, event.negativeMarks, event.queString);
        yield SubmitTestResultLoadedState(
            submitTestResultModel: submitTestResultModel);
      } catch (e) {
        yield SubmitTestResultErrorState();
      }
    }
    if (event is FetchTestResultEvent) {
      yield FetchTestResultLoadingState();
      // try{
      FetchTestResultModel fetchTestResultModel = await commonApiRepository
          .fetchTestResult(event.testHash, event.totalQues);
      yield FetchTestResultLoadedState(
          fetchTestResultModel: fetchTestResultModel);
      // }catch(e){
      //    yield FetchTestResultErrorState(message: e.toString());
      // }
    }
    if (event is FetchTestDataHashEvent) {
      yield FetchTestDataHashLoadingState();
      try {
        FetchTestDataHashModel fetchTestDataHashModel =
            await commonApiRepository.fetchTestDataHash(event.dataHash);
        yield FetchTestDataHashLoadedState(
            fetchTestDataHashModel: fetchTestDataHashModel);
      } catch (e) {
        yield FetchTestDataHashErrorState();
      }
    }
  }
}
