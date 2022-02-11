import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
// import 'package:career_lift_mobile_app/common/bloc/common_api_bloc.dart';
// import 'package:career_lift_mobile_app/common/bloc/common_api_events.dart';
// import 'package:career_lift_mobile_app/common/bloc/common_api_states.dart';
// import 'package:career_lift_mobile_app/common/database/my_store.dart';
// import 'package:career_lift_mobile_app/common/model/database_model.dart';
// import 'package:career_lift_mobile_app/common/navigator_class/navigator_class.dart';
// import 'package:career_lift_mobile_app/common/resources/strings/assets_constant.dart';
// import 'package:career_lift_mobile_app/common/resources/strings/colors_utility.dart';
// import 'package:career_lift_mobile_app/common/resources/strings/value_string.dart';
// import 'package:career_lift_mobile_app/common/utilities/internet_util.dart';
// import 'package:career_lift_mobile_app/common/utilities/util.dart';
// import 'package:career_lift_mobile_app/common/widgets/alert_dialog.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:quiz/common/Resources/strings/assets_constant.dart';
import 'package:quiz/common/Resources/strings/colors_utility.dart';
import 'package:quiz/common/Resources/strings/value_string.dart';
import 'package:quiz/common/bloc/common_api_bloc.dart';
import 'package:quiz/common/bloc/common_api_events.dart';
import 'package:quiz/common/bloc/common_api_states.dart';
import 'package:quiz/common/database/my_store.dart';
import 'package:quiz/common/model/database_model.dart';
import 'package:quiz/common/navigator_class/navigator_class.dart';
import 'package:quiz/common/utilities/internet_util.dart';
import 'package:quiz/common/utilities/util.dart';
import 'package:quiz/common/widgets/alert_dialog.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore_for_file: non_constant_identifier_names
class QuizAllQuestionsScreen extends StatefulWidget {
  final int id;
  final String positiveMarks;
  final double totalMarks;
  final String negativeMarks;
  final String title;
  final String testHash;
  final String totalTime;
  final bool isAlreadyAttempt;
  final String totalQuestion;

  const QuizAllQuestionsScreen(
      {Key? key,
      required this.id,
      required this.totalMarks,
      required this.title,
      required this.negativeMarks,
      required this.positiveMarks,
      required this.testHash,
      required this.totalTime,
      required this.isAlreadyAttempt,
      required this.totalQuestion})
      : super(key: key);

  @override
  _QuizAllQuestionsScreenState createState() => _QuizAllQuestionsScreenState();
}

class _QuizAllQuestionsScreenState extends State<QuizAllQuestionsScreen> {
  late List data;
  MyStore store = VxState.store;

  late List<List<Color>> result;
  late bool isDone;
  late SwiperController _controller;
  late int initPos;
  CommonApiBloc? commonApiBloc;

  bool isSubmitClicked = false;

  @override
  void initState() {
    _controller = SwiperController();
    isDone = false;
    commonApiBloc = BlocProvider.of<CommonApiBloc>(context);
    commonApiBloc!.add(FetchTestQuestionsEvent(testHash: widget.testHash));
    super.initState();
    initPos = 1;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Container> getOptions(
      element, SwiperController _controller, List<Color> result) {
    List<Container> reslist = [];
    int count = 0;
    element.toJson().forEach((key, value) {
      if (key.contains('opt') && key != 'correct_opt' && value != '') {
        reslist.add(Container(
          height: 50,
          width: MediaQuery.of(context).size.width / 6,
          child: MaterialButton(
            padding: EdgeInsets.symmetric(horizontal: 5),
            onPressed: result.count((n) => n == Colors.green) == 1
                ? null
                : () {
                    if (key[key.length - 1] == element.correctOpt) {
                      print('If');
                      if (mounted)
                        setState(() {
                          result[int.parse(key[key.length - 1]) - 1] =
                              Colors.green;
                        });
                    } else {
                      print('Else');
                      if (mounted)
                        setState(() {
                          result[int.parse(element.correctOpt) - 1] =
                              Colors.green;
                          result[int.parse(key[key.length - 1]) - 1] =
                              Colors.red;
                        });
                    }
                    // Timer(Duration(seconds: 1), () {
                    //   _controller.next(animation: true);
                    // });
                  },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  width: MediaQuery.of(context).size.width / 6,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: result[int.parse(key[key.length - 1]) - 1]),
                  child: Center(
                    child: Text(
                      String.fromCharCode(65 + count),
                      style: TextStyle(fontSize: 25),
                    ),
                  )),
            ),
          ),
        ));
        count++;
      }
    });
    return reslist;
  }

  List<Widget> getOptionsText(dynamic data) {
    List<Widget> options = [];
    int countNew = 0;
    data.toJson().forEach((key, value) {
      if (key.contains('opt') && key != 'correct_opt' && value != '') {
        options.add(value.toString().contains('<img')
            ? Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(String.fromCharCode(65 + countNew) + '. '),
                      Html.fromDom(
                        style: {
                          'p': Style(
                              color: Colors.white,
                              textAlign: TextAlign.start,
                              fontSize: FontSize.xLarge)
                        },
                        document: htmlparser.parse(
                          '<p>' + value + '</p>',
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    String.fromCharCode(65 + countNew) +
                        '. ' +
                        htmlparser.parse('<p>' + value + '</p>').body!.text,
                    minFontSize: 18,
                    maxFontSize: 20,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.start,
                    maxLines: 3,
                  ),
                ),
              ));
        countNew++;
      }
    });
    return options;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            leading: BackButton(
              onPressed: () {
                if (!isSubmitClicked) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertBox(
                          text: ValueString.yes,
                          secondText: ValueString.no,
                          title: ValueString.exitTest,
                          content: ValueString.sureWantToExit,
                          press: () async {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          secondPress: () {
                            Navigator.pop(context);
                          },
                        );
                      });
                }
              },
            ),
            title: Text(
              widget.title,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isDone
                    ? (initPos != 1)
                        ? FloatingActionButton(
                            mini: true,
                            heroTag: null,
                            onPressed: () {
                              _controller.previous();
                            },
                            child: Icon(Icons.arrow_back),
                          )
                        : SizedBox()
                    : SizedBox(),
                (isDone)
                    ? (((initPos + 1) > (data.length)))
                        ? FloatingActionButton.extended(
                            isExtended: true,
                            onPressed: () {
                              setState(() {
                                isSubmitClicked = true;
                              });
                              InternetUtil.isInternetAvailable((status) async {
                                if (status) {
                                  alertDailogConfirmation();
                                } else {
                                  showCustomSnackBar(
                                      context, ValueString.NO_INTERNET);
                                }
                              });
                            },
                            label: Text(ValueString.submit))
                        : FloatingActionButton(
                            mini: true,
                            heroTag: null,
                            onPressed: () {
                              _controller.next();
                            },
                            child: Icon(Icons.arrow_forward),
                          )
                    : SizedBox()
              ],
            ),
          ),
          body: BlocConsumer<CommonApiBloc, CommonApiStates>(
              builder: (BuildContext context, state) {
            if (state is FetchTestQuestionsLoadingState) {
              return Center(
                child: Image(
                  image: new AssetImage(
                    AssetsConstant.laodingBarGif,
                  ),
                ),
              );
            }

            if (state is FetchTestQuestionsLoadedState) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          isDone
                              ? CircularCountDownTimer(
                                  duration: int.parse(widget.totalTime) * 60,
                                  initialDuration: 0,
                                  controller: CountDownController(),
                                  width: buildWidth(context) * 0.14,
                                  height: buildWidth(context) * 0.14,
                                  ringColor: Colors.grey[300]!,
                                  ringGradient: null,
                                  fillColor: ColorsUtility.primaryColor,
                                  fillGradient: null,
                                  backgroundGradient: null,
                                  strokeWidth: 5,
                                  strokeCap: StrokeCap.round,
                                  textStyle: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  textFormat: CountdownTextFormat.MM_SS,
                                  isReverse: true,
                                  isReverseAnimation: true,
                                  isTimerTextShown: true,
                                  autoStart: true,
                                  onComplete: () {
                                    InternetUtil.isInternetAvailable(
                                        (status) async {
                                      if (status) {
                                        final box = store.dataStore
                                            .box<TestDataElement>();
                                        TestDataElement _testDataElement =
                                            box.get(widget.id)!;
                                        print(_testDataElement.toString());
                                        _testDataElement.is_attempted = 1;
                                        box.putAsync(_testDataElement);
                                        print("result-" + result.toString());
                                        NavigatorClass()
                                            .navigateToTestResultScreen(
                                                context,
                                                true,
                                                widget.totalMarks,
                                                data,
                                                widget.positiveMarks,
                                                widget.negativeMarks,
                                                result,
                                                widget.testHash);
                                      } else {
                                        showCustomSnackBar(
                                            context, ValueString.NO_INTERNET);
                                      }
                                    });
                                  },
                                )
                              : Text(ValueString.initializingTimer)
                        ]),
                  ),
                  Expanded(
                    child: isDone
                        ? Swiper(
                            autoplay: false,
                            onIndexChanged: (e) {
                              initPos = e;
                              if (mounted)
                                setState(() {
                                  if (initPos <=
                                      state.fetchTestQuestionsModel!.questions!
                                          .length) initPos++;
                                });
                            },
                            physics: NeverScrollableScrollPhysics(),
                            fade: 100,
                            scrollDirection: Axis.horizontal,
                            loop: false,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                  color: ColorsUtility.primaryColor,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 25, horizontal: 8),
                                  elevation: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 5),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[] +
                                            [
                                              Expanded(
                                                flex: 2,
                                                child: state
                                                        .fetchTestQuestionsModel!
                                                        .questions![index]
                                                        .quesDesc
                                                        .toString()
                                                        .contains('<img')
                                                    ? Html.fromDom(
                                                        style: {
                                                          'body': Style(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: FontSize
                                                                  .xLarge)
                                                        },
                                                        document:
                                                            htmlparser.parse(
                                                          '<body>' +
                                                              state
                                                                  .fetchTestQuestionsModel!
                                                                  .questions![
                                                                      index]
                                                                  .quesDesc! +
                                                              '</body>',
                                                        ),
                                                      )
                                                    : SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        physics:
                                                            AlwaysScrollableScrollPhysics(),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 8.0),
                                                          child: Center(
                                                            child: AutoSizeText(
                                                              htmlparser
                                                                  .parse(state
                                                                      .fetchTestQuestionsModel!
                                                                      .questions![
                                                                          index]
                                                                      .quesDesc)
                                                                  .body!
                                                                  .text,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                              minFontSize: 18,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                              ),
                                            ] +
                                            getOptionsText(state
                                                .fetchTestQuestionsModel!
                                                .questions![index]) +
                                            [
                                              Wrap(
                                                  children: getOptions(
                                                      state
                                                          .fetchTestQuestionsModel!
                                                          .questions![index],
                                                      _controller,
                                                      result[index])),
                                            ],
                                      ),
                                    ),
                                  ));
                            },
                            itemCount: state
                                .fetchTestQuestionsModel!.questions!.length,
                            itemWidth: MediaQuery.of(context).size.width,
                            itemHeight:
                                MediaQuery.of(context).size.height / 1.4,
                            controller: _controller,
                            layout: SwiperLayout.STACK,
                          )
                        : Center(
                            child: Image(
                              image: new AssetImage(
                                AssetsConstant.laodingBarGif,
                              ),
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StepProgressIndicator(
                      selectedSize: 10,
                      unselectedSize: 5,
                      totalSteps: isDone
                          ? state.fetchTestQuestionsModel!.questions!.length
                          : 1,
                      currentStep: isDone ? initPos : 1,
                    ),
                  ),
                ],
              );
            }
            return SizedBox.shrink();
          }, listener: (context, state) {
            if (state is FetchTestQuestionsLoadedState) {
              data = state.fetchTestQuestionsModel!.questions!;
              result = List.generate(data.length, (index) {
                List<Color> temp = [];
                data[index].toJson().forEach((key, value) {
                  if (key.contains('opt') &&
                      key != 'correct_opt' &&
                      value != '') temp.add(Colors.white);
                });
                return temp;
              });
              // print("result--"+result.toString());
              setState(() {
                isDone = true;
              });
            }
          }),
        ),
        onWillPop: () => _willPopCallback());
  }

  _willPopCallback() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertBox(
            text: 'Yes',
            secondText: 'No',
            title: 'Exit Test',
            content: 'Are you sure you want to exit the test?',
            press: () async {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            secondPress: () {
              Navigator.pop(context);
            },
          );
        });
  }

  alertDailogConfirmation() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertBox(
            text: ValueString.yes,
            secondText: ValueString.no,
            title: ValueString.submitQuiz,
            content: ValueString.wantToSubmitQuiz,
            press: () async {
              Navigator.pop(context);
              final box = store.dataStore.box<TestDataElement>();
              TestDataElement _testDataElement = box.get(widget.id)!;
              print(widget.id);
              _testDataElement.is_attempted = 1;
              box.putAsync(_testDataElement);
              print("result-" + result.toString());
              if (widget.isAlreadyAttempt) {
                checkResultAction();
              } else {
                NavigatorClass().navigateToTestResultScreen(
                    context,
                    true,
                    widget.totalMarks,
                    data,
                    widget.positiveMarks,
                    widget.negativeMarks,
                    result,
                    widget.testHash);
              }
            },
            secondPress: () {
              Navigator.pop(context);
            },
          );
        });
  }

  void checkResultAction() {
    InternetUtil.isInternetAvailable((status) async {
      if (status) {
        NavigatorClass().navigateToTestAlreadyAttemptedScreenRemovePrevious(
            context,
            true,
            widget.id,
            widget.negativeMarks,
            widget.totalQuestion,
            widget.positiveMarks,
            widget.totalTime,
            widget.title,
            widget.title,
            widget.testHash,
            widget.totalMarks.toString());
      } else {
        showCustomSnackBar(context, ValueString.NO_INTERNET);
      }
    });
  }
}
