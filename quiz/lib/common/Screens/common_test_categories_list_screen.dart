import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/common/database/my_store.dart';
import 'package:quiz/common/database/objectbox_db.dart';
import 'package:quiz/common/model/database_model.dart';
import 'package:quiz/common/navigator_class/navigator_class.dart';
import 'package:quiz/common/resources/strings/assets_constant.dart';
import 'package:quiz/common/resources/strings/colors_utility.dart';
import 'package:quiz/common/resources/strings/value_string.dart';
import 'package:quiz/common/utilities/internet_util.dart';
import 'package:quiz/common/utilities/util.dart';
import 'package:rxdart/rxdart.dart';
import 'package:velocity_x/velocity_x.dart';

class TestCategoriesListScreen extends StatefulWidget {
  final bool isQuiz;
  final String title;
  final List<String> tabs;
  final int examId;

  const TestCategoriesListScreen(
      {Key? key,
      required this.isQuiz,
      required this.title,
      required this.tabs,
      required this.examId})
      : super(key: key);

  @override
  _TestCategoriesListScreenState createState() =>
      _TestCategoriesListScreenState();
}

class _TestCategoriesListScreenState extends State<TestCategoriesListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late BehaviorSubject<List<TestDataElement>> _streamTestDataElement;
  late BehaviorSubject<List<TestReadingElement>> _streamTestReadingElement;
  MyStore store = VxState.store;
  bool isAlreadyAttempt = false;

  BehaviorSubject<List<TestReadingElement>> getTestReadingStore(String param) {
    _streamTestReadingElement = BehaviorSubject();
    _streamTestReadingElement.addStream(store.dataStore
        .box<TestReadingElement>()
        .query(TestReadingElement_.subcategory
            .equals(widget.examId.toString())
            .and(TestReadingElement_.type
                .equals(param)
                .and(TestReadingElement_.status.equals('active'))))
        .watch(triggerImmediately: true)
        .map((query) => query.find()));

    return _streamTestReadingElement;
  }

  @override
  void initState() {
    print(widget.examId);
    print(widget.title);
    if (mounted)
      setState(() {
        _streamTestDataElement = BehaviorSubject();
        _streamTestDataElement.addStream(store.dataStore
            .box<TestDataElement>()
            .query(TestDataElement_.exam_id
                .equals(widget.examId)
                .and(TestDataElement_.test_status.equals(1)))
            .watch(triggerImmediately: true)
            .map((query) => query.find()));
      });
    _tabController = TabController(length: widget.tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        bottom: TabBar(
            isScrollable: true,
            labelColor: ColorsUtility.black,
            indicatorColor: ColorsUtility.primaryColor,
            controller: _tabController,
            tabs: widget.tabs
                .map((e) => Tab(
                      text: e.toUpperCase().replaceAll('_', ' '),
                    ))
                .toList()),
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: widget.tabs
            .map(
              (e) => StreamBuilder(
                stream: (e == 'Mock Tests')
                    ? _streamTestDataElement
                    : getTestReadingStore(e),
                builder: (context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.hasData &&
                      !store.dataStore.box<TestDataElement>().isEmpty() &&
                      !store.dataStore.box<TestReadingElement>().isEmpty())
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            child: GestureDetector(
                              onTap: () {
                                if (e != "Mock Tests") {
                                  if (e == 'model_test_paper') {
                                    NavigatorClass().navigateToPDFViewerPage(
                                        context,
                                        snapshot.data![index].title!,
                                        snapshot.data![index].add_date!,
                                        snapshot.data![index].url
                                            .toString()
                                            .substring(
                                                'https://careerliftprod.s3.amazonaws.com/'
                                                    .length,
                                                snapshot.data![index].url
                                                    .toString()
                                                    .length));
                                  } else {
                                    NavigatorClass()
                                        .navigateToKnowledgeZoneHtmlViewer(
                                            context,
                                            snapshot
                                                .data![index].mob_post_hash!,
                                            snapshot.data![index].add_date,
                                            snapshot.data![index].title);
                                  }
                                }
                              },
                              child: Card(
                                elevation: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 8,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: (e == 'Mock Tests')
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(snapshot
                                                          .data![index]
                                                          .test_name!),
                                                    )
                                                  : Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(snapshot
                                                          .data![index].title!),
                                                    ),
                                            ), //Title
                                            Container(
                                              child: e == 'Mock Tests'
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Text('${snapshot.data![index].total_ques}' +
                                                          ' Questions    ' +
                                                          '${snapshot.data![index].total_time}' +
                                                          ' Minutes\n' +
                                                          '${snapshot.data![index].test_desc}'),
                                                    )
                                                  : SizedBox(),
                                            ) //subTitle
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          child: e == 'Mock Tests'
                                              ? snapshot.data![index]
                                                          .is_attempted ==
                                                      1
                                                  ? Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        resultButton(
                                                            snapshot, index),
                                                        practiceBtnButton(
                                                            snapshot, index)
                                                      ],
                                                    )
                                                  : startButton(snapshot, index)
                                              : null,
                                        ),
                                      ), //trailing
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  return Center(
                    child: Image(
                      image: new AssetImage(
                        AssetsConstant.laodingBarGif,
                      ),
                    ),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }

  Widget practiceBtnButton(AsyncSnapshot<List> snapshot, int index) {
    return Container(
      height: 35,
      margin: EdgeInsets.symmetric(vertical: 6),
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: () {
            practiceBtnAction(snapshot, index);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: FittedBox(
              child: Text(
                ValueString.practiceBtn,
                style: TextStyle(color: Colors.white),
              ),
            ),
          )),
    );
  }

  Widget startButton(AsyncSnapshot<List> snapshot, int index) {
    return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: ColorsUtility.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: () {
          startAction(snapshot, index);
        },
        child: Text(
          ValueString.startBtn,
          style: TextStyle(color: Colors.white),
        ));
  }

  Widget resultButton(AsyncSnapshot<List> snapshot, int index) {
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          checkResultAction(snapshot, index);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: FittedBox(
            child: Text(
              ValueString.resultBtn,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  void startAction(
    AsyncSnapshot<List> snapshot,
    int index,
  ) {
    InternetUtil.isInternetAvailable((status) async {
      if (status) {
        NavigatorClass().navigateToExamInstructionScreen(
            context,
            widget.isQuiz,
            snapshot.data![index].id,
            snapshot.data![index].negative_mark,
            snapshot.data![index].total_ques,
            snapshot.data![index].positive_mark,
            snapshot.data![index].total_time,
            snapshot.data![index].test_name!,
            widget.title,
            snapshot.data![index].test_hash!,
            isAttempted: false);
      } else {
        showCustomSnackBar(context, ValueString.NO_INTERNET);
      }
    });
  }

  void practiceBtnAction(
    AsyncSnapshot<List> snapshot,
    int index,
  ) {
    InternetUtil.isInternetAvailable((status) async {
      if (status) {
        NavigatorClass().navigateToExamInstructionScreen(
            context,
            widget.isQuiz,
            snapshot.data![index].id,
            snapshot.data![index].negative_mark,
            snapshot.data![index].total_ques,
            snapshot.data![index].positive_mark,
            snapshot.data![index].total_time,
            snapshot.data![index].test_name!,
            widget.title,
            snapshot.data![index].test_hash!,
            isAttempted: true);
      } else {
        showCustomSnackBar(context, ValueString.NO_INTERNET);
      }
    });
  }

  void checkResultAction(AsyncSnapshot<List> snapshot, int index) {
    InternetUtil.isInternetAvailable((status) async {
      if (status) {
        NavigatorClass().navigateToTestAlreadyAttemptedScreen(
            context,
            widget.isQuiz,
            snapshot.data![index].id,
            snapshot.data![index].negative_mark,
            snapshot.data![index].total_ques,
            snapshot.data![index].positive_mark,
            snapshot.data![index].total_time,
            snapshot.data![index].test_name!,
            widget.title,
            snapshot.data![index].test_hash!,
            snapshot.data![index].total_mark);
      } else {
        showCustomSnackBar(context, ValueString.NO_INTERNET);
      }
    });
  }
}
