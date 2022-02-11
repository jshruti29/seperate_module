import 'package:quiz/common/Screens/common_test_categories_list_screen.dart';
import 'package:quiz/common/bloc/common_api_bloc.dart';
import 'package:quiz/common/bloc/common_api_events.dart';
import 'package:quiz/common/bloc/common_api_states.dart';
import 'package:quiz/common/database/my_store.dart';
import 'package:quiz/common/model/database_model.dart';
import 'package:quiz/common/model/fetch_test_questions_model.dart';
import 'package:quiz/common/navigator_class/navigator_class.dart';
import 'package:quiz/common/resources/strings/assets_constant.dart';
import 'package:quiz/common/resources/strings/colors_utility.dart';
import 'package:quiz/common/resources/strings/value_string.dart';
import 'package:quiz/common/resources/style/app_text_style.dart';
import 'package:quiz/common/resources/style/decoration.dart';
import 'package:quiz/common/utilities/internet_util.dart';
import 'package:quiz/common/utilities/util.dart';
import 'package:quiz/common/widgets/alert_dialog.dart';
import 'package:quiz/common/widgets/text_button_widget.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:velocity_x/velocity_x.dart';

// ignore_for_file: non_constant_identifier_names
class ExamsAllQuestionsScreen extends StatefulWidget {
  final int id;
  final String positiveMarks;
  final double totalMarks;
  final String negativeMarks;
  final String title;
  final String testHash;
  final String totalTime;
  final bool isAttempted;
  final String totalQuestion;

  const ExamsAllQuestionsScreen({
    Key? key,
    required this.id,
    required this.totalMarks,
    required this.title,
    required this.negativeMarks,
    required this.positiveMarks,
    required this.testHash,
    required this.totalTime,
    required this.isAttempted,
    required this.totalQuestion,
  }) : super(key: key);

  @override
  _ExamsAllQuestionsScreenState createState() =>
      _ExamsAllQuestionsScreenState();
}

class _ExamsAllQuestionsScreenState extends State<ExamsAllQuestionsScreen>
    with TickerProviderStateMixin, KeepAliveParentDataMixin {
  late List<Question> data;
  MyStore store = VxState.store;
  late TabController _tabController;
  late CountDownController countDownController;
  late List<List<Color>> result;
  late List<String> responses;
  late bool isDone;
  late int initPos;
  double initScale = 1;
  TransformationController _transformationController =
      TransformationController();
  CommonApiBloc? commonApiBloc;

  bool isSubmitClicked = false;

  @override
  void initState() {
    isDone = false;
    data = [];
    commonApiBloc = BlocProvider.of<CommonApiBloc>(context);
    commonApiBloc!.add(FetchTestQuestionsEvent(testHash: widget.testHash));
    super.initState();
    initPos = 1;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<RadioListTile> getOptions(element, TabController _controller,
      List<Color> result, List<String> responses, int index) {
    List<RadioListTile> reslist = [];
    element.toJson().forEach((key, value) {
      if (key.contains('opt') && key != 'correct_opt' && value != '') {
        reslist.add(RadioListTile(
          groupValue: responses[index],
          value: key[key.length - 1],
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          onChanged: (e) {
            setState(() {
              responses[index] = e;
            });
            print(responses);
          },
          title: value.toString().contains('<img')
              ? Html.fromDom(
                  style: {'p': Style(fontSize: FontSize.larger)},
                  document: htmlparser.parse(
                    '<p>' + value + '</p>',
                  ),
                )
              : Text(
                  htmlparser.parse('<p>' + value + '</p>').body!.text,
                ),
        ));
      }
    });
    return reslist;
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
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocConsumer<CommonApiBloc, CommonApiStates>(
              builder: (context, state) {
                if (state is SubmitTestResultLoadingState) {
                  //return buildLoadingIndicator(context, 0);
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isDone
                        ? (initPos != 1)
                            ? FloatingActionButton(
                                mini: true,
                                heroTag: null,
                                onPressed: () {
                                  _tabController
                                      .animateTo(_tabController.index - 1);
                                  if (mounted)
                                    setState(() {
                                      initPos--;
                                    });
                                },
                                child: Icon(Icons.arrow_back),
                              )
                            : Text('')
                        : Text(''),
                    (isDone)
                        ? (((initPos + 1) > (data.length)))
                            ? Container(
                                margin: EdgeInsets.symmetric(vertical: 12),
                                child: TextButtonWidget(
                                    buttonTitle: ValueString.submit,
                                    onButtonPressed: () {
                                      InternetUtil.isInternetAvailable(
                                          (status) async {
                                        if (status) {
                                          showDialog(
                                              context: context,
                                              builder:
                                                  (BuildContext buildContext) {
                                                return AlertBox(
                                                  text: ValueString.yes,
                                                  secondText: ValueString.no,
                                                  title: ValueString.submitTest,
                                                  content: ValueString
                                                      .wantToSubmitTest,
                                                  press: () async {
                                                    setState(() {
                                                      isSubmitClicked = true;
                                                    });

                                                    Navigator.pop(buildContext);
                                                    countDownController.pause();
                                                    setState(() {
                                                      isDone = false;
                                                    });
                                                    List responsesNew = [];
                                                    responses
                                                        .forEach((element) {
                                                      if ((element) == '')
                                                        responsesNew.add(0);
                                                      else
                                                        responsesNew
                                                            .add(element);
                                                    });
                                                    List ques_stringList = [];
                                                    for (int i = 0;
                                                        i < responsesNew.length;
                                                        i++) {
                                                      ques_stringList.add(
                                                          '${data[i].quesId}#${responsesNew[i]}');
                                                    }
                                                    if (widget.isAttempted) {
                                                      checkResultAction();
                                                    } else {
                                                      commonApiBloc =
                                                          BlocProvider.of<
                                                                  CommonApiBloc>(
                                                              context);
                                                      commonApiBloc!.add(
                                                          SubmitTestResultEvent(
                                                              testHash: widget
                                                                  .testHash,
                                                              positiveMarks: widget
                                                                  .positiveMarks,
                                                              negativeMarks: widget
                                                                  .negativeMarks,
                                                              queString:
                                                                  ques_stringList
                                                                      .join(
                                                                          '|')));
                                                    }
                                                  },
                                                  secondPress: () {
                                                    Navigator.pop(buildContext);
                                                  },
                                                );
                                              });
                                        } else {
                                          showCustomSnackBar(
                                              context, ValueString.NO_INTERNET);
                                        }
                                      });
                                    },
                                    buttonBorderColor:
                                        ColorsUtility.primaryColor,
                                    buttonBackgroundColor:
                                        ColorsUtility.primaryColor,
                                    buttonTextColor: ColorsUtility.white,
                                    buttonTextStyle:
                                        TextStyle(color: ColorsUtility.white),
                                    buttonPadding: EdgeInsets.all(0.02),
                                    maxLines: 1,
                                    isIconPresent: false,
                                    shape: Shape.rectangleBorder8,
                                    isSkipped: false))
                            : FloatingActionButton(
                                mini: true,
                                heroTag: null,
                                onPressed: () {
                                  _tabController
                                      .animateTo(_tabController.index + 1);
                                  if (mounted)
                                    setState(() {
                                      initPos++;
                                    });
                                },
                                child: Icon(Icons.arrow_forward),
                              )
                        : Text('')
                  ],
                );
              },
              listener: (context, state) {},
            ),
          ),
          body: BlocConsumer<CommonApiBloc, CommonApiStates>(
              builder: (context, state) {
            if (state is FetchTestQuestionsLoadingState) {
              return buildLoadingIndicator(context, 0);
            }
            if (state is SubmitTestResultLoadingState) {
              return buildLoadingIndicator(context, 0);
            }
            if (state is FetchTestQuestionsLoadedState) {
              if (state.fetchTestQuestionsModel!.flag == 0 ||
                  state.fetchTestQuestionsModel!.questions!.length == 0) {
                return Scaffold(
                  body: Center(
                    child: Text(
                      "No Data Available ",
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                  ),
                );
              } else {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: buildWidth(context) * 0.015,
                          left: buildWidth(context) * 0.015,
                          right: buildWidth(context) * 0.015),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(ValueString.totalQuestions +
                                '${state.fetchTestQuestionsModel!.questions!.length}'),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: buildWidth(context) * 0.02,
                                          horizontal: 0),
                                      child: MaterialButton(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          padding: EdgeInsets.all(0),
                                          minWidth: 0,
                                          onPressed: () {
                                            if (initScale < 4) {
                                              ++initScale;
                                              _transformationController.value =
                                                  Matrix4.diagonal3Values(
                                                      initScale, initScale, 1);
                                            }
                                          },
                                          child: Image.asset(
                                              AssetsConstant.increaseFont)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MaterialButton(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          padding: EdgeInsets.all(0),
                                          minWidth: 0,
                                          onPressed: () {
                                            if (initScale > 1) {
                                              --initScale;
                                              _transformationController.value =
                                                  Matrix4.diagonal3Values(
                                                      initScale, initScale, 1);
                                            }
                                          },
                                          child: Image.asset(
                                            AssetsConstant.decreaseFont,
                                            scale: 1.2,
                                          )),
                                    ),
                                  ],
                                ),
                                isDone
                                    ? CircularCountDownTimer(
                                        duration:
                                            int.parse(widget.totalTime) * 60,
                                        initialDuration: 0,
                                        controller: countDownController,
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
                                              setState(() {
                                                isSubmitClicked = true;
                                                isDone = false;
                                              });
                                              List responsesNew = [];
                                              responses.forEach((element) {
                                                if ((element) == '')
                                                  responsesNew.add(0);
                                                else
                                                  responsesNew.add(element);
                                              });
                                              List ques_stringList = [];
                                              for (int i = 0;
                                                  i < responsesNew.length;
                                                  i++) {
                                                ques_stringList.add(
                                                    '${data[i].quesId}#${responsesNew[i]}');
                                              }
                                              commonApiBloc = BlocProvider.of<
                                                  CommonApiBloc>(context);
                                              commonApiBloc!.add(
                                                  SubmitTestResultEvent(
                                                      testHash: widget.testHash,
                                                      positiveMarks:
                                                          widget.positiveMarks,
                                                      negativeMarks:
                                                          widget.negativeMarks,
                                                      queString: ques_stringList
                                                          .join('|')));

                                              // final box = store.dataStore.box<TestDataElement>();
                                              // TestDataElement _testDataElement = box.get(widget.id)!;
                                              // print(_testDataElement.toString());
                                              // _testDataElement.is_attempted = 1;
                                              // box.putAsync(_testDataElement);
                                              // print("result--"+result.toString());
                                              // NavigatorClass().navigateToTestResultScreen(context, false, widget.totalMarks, state.fetchTestQuestionsModel!.questions!, widget.positiveMarks, widget.negativeMarks, result, widget.testHash);

                                            } else {
                                              showCustomSnackBar(context,
                                                  ValueString.NO_INTERNET);
                                            }
                                          });
                                        },
                                      )
                                    : Text(ValueString.initializingTimer),
                              ],
                            )
                          ]),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: isDone
                          ? Column(children: [
                              TabBar(
                                onTap: (index) {
                                  if (mounted)
                                    setState(() {
                                      initPos = index + 1;
                                    });
                                },
                                isScrollable: true,
                                controller: _tabController,
                                tabs: state.fetchTestQuestionsModel!.questions!
                                    .mapIndexed((currentValue, index) =>
                                        Padding(
                                          padding: EdgeInsets.all(
                                              buildWidth(context) * 0.012),
                                          child: FloatingActionButton(
                                            heroTag: null,
                                            onPressed: null,
                                            backgroundColor:
                                                initPos - 1 == index
                                                    ? ColorsUtility.primaryColor
                                                    : (responses[index] != '')
                                                        ? Colors.greenAccent
                                                        : Colors.white,
                                            foregroundColor:
                                                initPos - 1 == index
                                                    ? Colors.white
                                                    : Colors.black,
                                            child: Text(
                                              '${index + 1}',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                              Expanded(
                                child: TabBarView(
                                    physics: NeverScrollableScrollPhysics(),
                                    controller: _tabController,
                                    children:
                                        state
                                            .fetchTestQuestionsModel!.questions!
                                            .mapIndexed(
                                                (currentValue, index) =>
                                                    InteractiveViewer(
                                                      transformationController:
                                                          _transformationController,
                                                      minScale: 1,
                                                      child: ListView(
                                                          children: [
                                                                state
                                                                        .fetchTestQuestionsModel!
                                                                        .questions![
                                                                            index]
                                                                        .quesDesc
                                                                        .toString()
                                                                        .contains(
                                                                            '<img')
                                                                    ? Html
                                                                        .fromDom(
                                                                        style: {
                                                                          'body':
                                                                              Style(fontSize: FontSize.larger),
                                                                        },
                                                                        document:
                                                                            htmlparser.parse(
                                                                          '<body>' +
                                                                              state.fetchTestQuestionsModel!.questions![index].quesDesc! +
                                                                              '</body>',
                                                                        ),
                                                                      )
                                                                    : Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child:
                                                                            Text(
                                                                          htmlparser
                                                                              .parse(state.fetchTestQuestionsModel!.questions![index].quesDesc)
                                                                              .body!
                                                                              .text,
                                                                          style:
                                                                              TextStyle(fontSize: 15),
                                                                        ),
                                                                      ),
                                                              ] +
                                                              getOptions(
                                                                  state.fetchTestQuestionsModel!
                                                                          .questions![
                                                                      index],
                                                                  _tabController,
                                                                  result[index],
                                                                  responses,
                                                                  index) +
                                                              [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          50,
                                                                      vertical:
                                                                          8),
                                                                  child: TextButton(
                                                                      style: TextButton.styleFrom(elevation: 2, backgroundColor: ColorsUtility.primaryColor, shape: Shape.rectangleBorder20),
                                                                      onPressed: () {
                                                                        setState(
                                                                            () {
                                                                          responses[index] =
                                                                              '';
                                                                        });
                                                                      },
                                                                      child: Text(
                                                                        ValueString
                                                                            .clearSelction,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      )),
                                                                )
                                                              ]),
                                                    ))
                                            .toList()),
                              )
                            ])
                          : Center(child: CircularProgressIndicator()),
                    ),
                  ],
                );
              }
            }
            return SizedBox.shrink();
          }, listener: (context, state) {
            if (state is SubmitTestResultLoadedState) {
              print("in states");
              if (state.submitTestResultModel!.flag != 1) {
                showCustomSnackBar(context, ValueString.errorSubmittingResult);
                countDownController.resume();
                Fluttertoast.showToast(msg: "test data null");
                setState(() {
                  isDone = false;
                });
              } else {
                if (widget.id != null) {
                  final box = store.dataStore.box<TestDataElement>();
                  TestDataElement _testDataElement = box.get(widget.id)!;
                  _testDataElement.is_attempted = 1;
                  box.putAsync(_testDataElement);
                }
                NavigatorClass().navigateToExamCompletedScreen(
                    context, state.submitTestResultModel, widget.testHash);
              }
            }
            if (state is SubmitTestResultLoadingState) {}
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
              responses = List.filled(data.length, '');
              _tabController = TabController(length: data.length, vsync: this);
              countDownController = CountDownController();
              setState(() {
                isDone = true;
              });
            }
          }),
        ),
        onWillPop: () => _willPopCallback());
  }

  void checkResultAction() {
    InternetUtil.isInternetAvailable((status) async {
      if (status) {
        NavigatorClass().navigateToTestAlreadyAttemptedScreenRemovePrevious(
            context,
            false,
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

  @override
  void detach() {}

  @override
  bool get keptAlive => true;
}
