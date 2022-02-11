import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:percent_indicator/percent_indicator.dart';

import '/common/bloc/common_api_bloc.dart';
import '/common/bloc/common_api_events.dart';
import '/common/bloc/common_api_states.dart';
import '/common/model/submit_test_result_model.dart';
import '/common/resources/strings/assets_constant.dart';
import '/common/resources/strings/colors_utility.dart';
import '/common/resources/strings/value_string.dart';
import '/common/resources/style/decoration.dart';
import '/common/utilities/util.dart';

class TestResultScreen extends StatefulWidget {
  final List<String>? data;
  final List quesIDList;
  final double totalMarks;
  final bool isQuiz;
  final List<List<Color>>? colorData;

  final String positiveMarks;
  final String negativeMarks;
  final String testHash;

  const TestResultScreen(
      {Key? key,
      required this.isQuiz,
      required this.totalMarks,
      required this.quesIDList,
      this.data,
      this.colorData,
      required this.testHash,
      required this.negativeMarks,
      required this.positiveMarks})
      : super(key: key);

  @override
  _TestResultScreenState createState() => _TestResultScreenState();
}

class _TestResultScreenState extends State<TestResultScreen> {
  late bool isDone;
  late bool isAttempted;
  late List ques;
  late Map<String, dynamic> overallReport;
  CommonApiBloc? commonApiBloc;

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

  void initState() {
    print("initState-" + widget.data.toString());
    isDone = false;
    overallReport = {};
    List responses = [];
    if (widget.isQuiz) {
      widget.colorData!.forEach((element) {
        if (element.contains(Colors.red))
          responses.add(element.indexOf(Colors.red) + 1);
        else if (element.contains(Colors.green))
          responses.add(element.indexOf(Colors.green) + 1);
        else
          responses.add(0);
      });
    } else {
      if (widget.data != null) {
        widget.data!.forEach((element) {
          if ((element) == '')
            responses.add(0);
          else
            responses.add(element);
        });
      } else {
        widget.colorData!.forEach((element) {
          if (element.contains(Colors.red))
            responses.add(element.indexOf(Colors.red) + 1);
          else if (element.contains(Colors.green))
            responses.add(element.indexOf(Colors.green) + 1);
          else
            responses.add(0);
        });
      }
    }
    print(responses);

    List ques_stringList = [];
    for (int i = 0; i < responses.length; i++) {
      ques_stringList.add('${widget.quesIDList[i].quesId}#${responses[i]}');
    }
    commonApiBloc = BlocProvider.of<CommonApiBloc>(context);
    commonApiBloc!.add(SubmitTestResultEvent(
        testHash: widget.testHash,
        positiveMarks: widget.positiveMarks,
        negativeMarks: widget.negativeMarks,
        queString: ques_stringList.join('|')));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(ValueString.testResult),
          ),
          body: BlocConsumer<CommonApiBloc, CommonApiStates>(
            builder: (BuildContext context, state) {
              if (state is SubmitTestResultLoadingState) {
                return Center(
                  child: Image(
                    image: new AssetImage(
                      AssetsConstant.spinnerGif,
                    ),
                    height: 100,
                  ),
                );
              }
              if (state is SubmitTestResultErrorState) {
                return Center(child: Text(ValueString.alreadyAttempted));
              }
              if (state is SubmitTestResultLoadedState) {
                isDone = true;
                if (isAttempted) {
                  Center(child: Text(ValueString.alreadyAttempted));
                } else {
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
                                        '${state.submitTestResultModel!.percentage}%',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(ValueString.totalMarks,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 15)),
                                      Text(
                                          '${state.submitTestResultModel!.markObtain}/${widget.totalMarks}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 15))
                                    ],
                                  ),
                                  percent: double.parse(state
                                          .submitTestResultModel!.percentage!
                                          .toString()) /
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
                                    padding: EdgeInsets.all(
                                        buildWidth(context) * 0.038),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        textInformationWidget(
                                            ValueString.totalCorrect,
                                            '${state.submitTestResultModel!.totCorrect}'),
                                        textInformationWidget2(
                                            ValueString.totalInCorrect,
                                            '${state.submitTestResultModel!.totIncorrect}'),
                                        textInformationWidget3(
                                            ValueString.notAttempted,
                                            '${state.submitTestResultModel!.notAttempt}'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ] +
                            buildList(state.submitTestResultModel!.ques),
                      ),
                    ],
                  );
                }
              }
              return SizedBox.shrink();
            },
            listener: (context, state) {
              if (state is SubmitTestResultLoadedState) {
                if (state.submitTestResultModel!.flag == 1) {
                  isAttempted = false;
                } else
                  isAttempted = true;
                isDone = true;
              }
            },
          )),
    );
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
