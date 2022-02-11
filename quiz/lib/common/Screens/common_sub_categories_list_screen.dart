import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quiz/common/database/my_store.dart';
import 'package:quiz/common/database/objectbox_db.dart';
import 'package:quiz/common/model/database_model.dart';
import 'package:quiz/common/navigator_class/navigator_class.dart';
import 'package:quiz/common/resources/strings/assets_constant.dart';
import 'package:rxdart/rxdart.dart';
import 'package:velocity_x/velocity_x.dart';
import "package:collection/collection.dart";

class TestSubCategoriesListScreen extends StatefulWidget {
  final String title;
  final List<String> tabs;
  final int examId;

  const TestSubCategoriesListScreen(
      {Key? key, required this.title, required this.examId, required this.tabs})
      : super(key: key);

  @override
  _TestSubCategoriesListScreenState createState() =>
      _TestSubCategoriesListScreenState();
}

class _TestSubCategoriesListScreenState
    extends State<TestSubCategoriesListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late BehaviorSubject<List<TestDataElement>> _streamTestDataElement;
  MyStore store = VxState.store;
  List<String> testList = [];

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
            .map((query) {
          return query.find();
        }));
      });
    _tabController = TabController(length: widget.tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Map<String?, List<TestDataElement>> groupEmployeesByCountry(
      List<TestDataElement> groupByList) {
    final groups = groupBy(groupByList, (TestDataElement e) {
      return e.test_tag;
    });
    return groups;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
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
                stream: _streamTestDataElement,
                builder:
                    (context, AsyncSnapshot<List<TestDataElement>> snapshot) {
                  if (snapshot.hasData &&
                      !store.dataStore.box<TestDataElement>().isEmpty()) {
                    var listTemp = groupEmployeesByCountry(snapshot.data!);
                    List<dynamic> tempList = [];
                    List<dynamic> passList = [];
                    if (listTemp.isNotEmpty && listTemp.length > 0) {
                      listTemp.forEach((key, value) {
                        tempList.add(key);
                        passList.add(value);
                      });
                      return ListView.builder(
                          itemCount: tempList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              child: GestureDetector(
                                onTap: () {
                                  // NavigatorClass()
                                  //     .navigateToSubTestCategoriesList(
                                  //   context,
                                  //   tempList[index],
                                  //   passList[index],
                                  // );
                                },
                                child: Card(
                                  elevation: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(tempList[index]
                                                      .toString()),
                                                ),
                                              ), //Title
                                            ],
                                          ),
                                        ), //trailing
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                    return Center(
                      child: Image(
                        image: new AssetImage(
                          AssetsConstant.laodingBarGif,
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: Image(
                        image: new AssetImage(
                          AssetsConstant.laodingBarGif,
                        ),
                      ),
                    );
                  }
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
