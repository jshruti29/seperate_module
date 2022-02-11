import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:percent_indicator/percent_indicator.dart';

import '/common/bloc/common_api_bloc.dart';
import '/common/bloc/common_api_events.dart';
import '/common/bloc/common_api_states.dart';
import '/common/model/fetch_test_result_model.dart';
import '/common/resources/strings/assets_constant.dart';
import '/common/resources/strings/colors_utility.dart';
import '/common/resources/strings/value_string.dart';
import '/common/resources/style/decoration.dart';
import '/common/utilities/util.dart';

class TestAlreadyAttemptedScreen extends StatefulWidget {
  final String totalQues;
  final bool isQuiz;
  final String test_hash;
  final String totalMark;
  final int id;
  final String incorrectMarks;
  final String correctMarks;
  final String totalTime;
  final String heading;
  final String title;

  const TestAlreadyAttemptedScreen({
    Key? key,
    required this.isQuiz,
    required this.totalTime,
    required this.id,
    required this.incorrectMarks,
    required this.correctMarks,
    required this.heading,
    required this.title,
    required this.totalQues,
    required this.test_hash,
    required this.totalMark,
  }) : super(key: key);

  @override
  _TestAlreadyAttemptedScreenState createState() =>
      _TestAlreadyAttemptedScreenState();
}

class _TestAlreadyAttemptedScreenState
    extends State<TestAlreadyAttemptedScreen> {
  late bool isDone;
  late List data;
  late Map<String, dynamic> overallReport;
  late List ques;
  CommonApiBloc? commonApiBloc;

  @override
  void initState() {
    isDone = false;
    commonApiBloc = BlocProvider.of<CommonApiBloc>(context);
    commonApiBloc!.add(FetchTestResultEvent(
        testHash: widget.test_hash, totalQues: widget.totalQues));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(ValueString.testResult),
          ),
          body: BlocBuilder<CommonApiBloc, CommonApiStates>(
              builder: (BuildContext context, state) {
            if (state is FetchTestResultLoadingState) {
              return Center(
                child: Image(
                  image: new AssetImage(
                    AssetsConstant.hourGlassGif,
                  ),
                  height: 100,
                ),
              );
            }
            if (state is FetchTestResultErrorState) {
              return buildErrorUiCurrentAffairs(state.message.toString(), 0);
            }
            if (state is FetchTestResultLoadedState) {
              isDone = true;
              return ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                          CircularPercentIndicator(
                              lineWidth: 10,
                              animation: true,
                              animationDuration: 1500,
                              progressColor: ColorsUtility.primaryColor,
                              center: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${state.fetchTestResultModel!.percentage}%',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(ValueString.totalMarks,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15)),
                                  Text(
                                      '${state.fetchTestResultModel!.markObtain}/${widget.totalMark}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15))
                                ],
                              ),
                              percent: double.parse(
                                      state.fetchTestResultModel!.percentage!) /
                                  100,
                              radius: 150),
                          SizedBox(height: buildWidth(context) * 0.025),
                          Text(
                            ValueString.overallReport,
                            style: TextStyle(fontSize: 40),
                          ),
                          SizedBox(height: buildWidth(context) * 0.025),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: buildWidth(context) * 0.02),
                            child: Material(
                              elevation: 5,
                              shape: Shape.rectangleBorder20,
                              child: Padding(
                                padding:
                                    EdgeInsets.all(buildWidth(context) * 0.038),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    textInformationWidget(
                                        ValueString.totalCorrect,
                                        '${state.fetchTestResultModel!.totCorrect}'),
                                    textInformationWidget2(
                                        ValueString.totalInCorrect,
                                        '${state.fetchTestResultModel!.totIncorrect}'),
                                    textInformationWidget3(
                                        ValueString.notAttempted,
                                        '${state.fetchTestResultModel!.notAttempt}'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ] +
                        buildList(state.fetchTestResultModel!.ques),
                  ),
                ],
              );
            }
            return SizedBox.shrink();
          })),
    );
  }

  List<Padding> buildList(List<Que>? ques) {
    List<Padding> data = [];
    int count = 1;
    ques!.forEach((element) {
      data.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 5,
          child: ExpansionTile(
            iconColor: Colors.black,
            leading: Text(
              '$count.',
              style: TextStyle(fontSize: 20),
            ),
            expandedAlignment: Alignment.center,
            expandedCrossAxisAlignment: CrossAxisAlignment.center,
            textColor: Colors.black,
            childrenPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            children: [
              Text(
                ValueString.questionExplaination,
                style: TextStyle(color: Colors.black),
              ),
              element.quesExpl!.contains('<img')
                  ? Html.fromDom(
                      document: htmlparser.parse(
                        element.quesExpl,
                      ),
                    )
                  : Text(
                      htmlparser.parse(element.quesExpl).body!.text,
                      style: TextStyle(color: Colors.black),
                    ),
            ],
            title: element.quesDesc!.contains('<img')
                ? Html.fromDom(
                    document: htmlparser.parse(
                      element.quesDesc,
                    ),
                  )
                : Text(htmlparser.parse(element.quesDesc).body!.text),
            subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      if (element.opt1 != null &&
                          element.opt1.toString().length > 0)
                        Text("1. " + htmlparser.parse(element.opt1).body!.text),
                      SizedBox(height: 2),
                      if (element.opt2 != null &&
                          element.opt2.toString().length > 0)
                        Text("2. " + htmlparser.parse(element.opt2).body!.text),
                      SizedBox(height: 2),
                      if (element.opt3 != null &&
                          element.opt3.toString().length > 0)
                        Text("3. " + htmlparser.parse(element.opt3).body!.text),
                      if (element.opt4 != null &&
                          element.opt4.toString().length > 0)
                        SizedBox(height: 2),
                      if (element.opt4 != null &&
                          element.opt4.toString().length > 0)
                        Text("4. " + htmlparser.parse(element.opt4).body!.text),
                      if (element.opt5 != null &&
                          element.opt5.toString().length > 0)
                        SizedBox(height: 2),
                      if (element.opt5 != null &&
                          element.opt5.toString().length > 0)
                        Text("5. " + htmlparser.parse(element.opt5).body!.text),
                      SizedBox(height: 5),
                      ('${element.userResponse}' == '0')
                          ? Text(ValueString.yourAnswer + ValueString.nA)
                          : Text(
                              ValueString.yourAnswer +
                                  '${element.userResponse}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                      SizedBox(height: 5),
                      Text(
                          ValueString.correctAnswer +
                              ": " +
                              element.correctOpt!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                      SizedBox(height: 5)
                    ],
                  ),
                ]),
            trailing: ('${element.userResponse}' == '0')
                ? Text(
                    ValueString.notAttempt,
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  )
                : Icon(
                    // ignore: unrelated_type_equality_checks
                    element.quesStatus == 'correct' ? Icons.check : Icons.close,
                    // ignore: unrelated_type_equality_checks
                    color: element.quesStatus == 'correct'
                        ? Colors.green
                        : Colors.red,
                    size: 45,
                  ),
          ),
        ),
      ));
      count++;
    });
    return data;
  }

  Widget textInformationWidget(title, text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 30, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }

  Widget textInformationWidget2(title, text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  Widget textInformationWidget3(title, text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 30, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
