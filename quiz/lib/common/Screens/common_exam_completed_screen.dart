// import 'package:career_lift_mobile_app/common/model/submit_test_result_model.dart';
// import 'package:career_lift_mobile_app/common/navigator_class/navigator_class.dart';
// import 'package:career_lift_mobile_app/common/resources/strings/colors_utility.dart';
// import 'package:career_lift_mobile_app/common/resources/strings/value_string.dart';
import 'package:flutter/material.dart';
import 'package:quiz/common/model/submit_test_result_model.dart';
import 'package:quiz/common/navigator_class/navigator_class.dart';
import 'package:quiz/common/resources/strings/colors_utility.dart';
import 'package:quiz/common/resources/strings/value_string.dart';

//ignore_for_file: non_constant_identifier_names
class ExamCompletedScreen extends StatefulWidget {
  final SubmitTestResultModel examResult;
  final String test_hash;
  const ExamCompletedScreen({
    Key? key,
    required this.test_hash,
    required this.examResult,
  }) : super(key: key);

  @override
  _ExamCompletedScreenState createState() => _ExamCompletedScreenState();
}

class _ExamCompletedScreenState extends State<ExamCompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/completed.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ValueString.congratulations,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Text(
                  ValueString.testCompleted,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(ValueString.correctAnswer),
                                    Text('${widget.examResult.totCorrect}',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(ValueString.incorrectAnswer),
                                    Text(
                                      '${widget.examResult.totIncorrect}',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            ]),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextButton(
                      onPressed: () {
                        // NavigatorClass().navigateToExamResultAnalysis(
                        //     context, widget.examResult);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60.0, vertical: 5),
                        child: Text(
                          ValueString.checkAnalysis,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      style: TextButton.styleFrom(
                          elevation: 10,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60.0, vertical: 5),
                        child: Text(
                          ValueString.exit,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      style: TextButton.styleFrom(
                          elevation: 10,
                          backgroundColor: ColorsUtility.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                )
              ],
            )
          ]),
    )));
  }
}
