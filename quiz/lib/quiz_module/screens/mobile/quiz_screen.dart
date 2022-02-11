// import 'package:career_lift_mobile_app/common/database/my_store.dart';
// import 'package:career_lift_mobile_app/common/database/objectbox_db.dart';
// import 'package:career_lift_mobile_app/common/model/database_model.dart';
import 'package:quiz/common/navigator_class/navigator_class.dart';
// import 'package:career_lift_mobile_app/common/resources/strings/assets_constant.dart';
// import 'package:career_lift_mobile_app/common/resources/strings/value_string.dart';
// import 'package:career_lift_mobile_app/common/resources/style/decoration.dart';
// import 'package:career_lift_mobile_app/common/utilities/util.dart';
import 'package:flutter/material.dart';
import 'package:quiz/common/Resources/strings/assets_constant.dart';
import 'package:quiz/common/Resources/strings/value_string.dart';
import 'package:quiz/common/Resources/style/decoration.dart';
import 'package:quiz/common/database/my_store.dart';
import 'package:quiz/common/database/objectbox_db.dart';
import 'package:quiz/common/model/database_model.dart';
import 'package:quiz/common/utilities/util.dart';
import 'package:rxdart/rxdart.dart';
import 'package:velocity_x/velocity_x.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  MyStore store = VxState.store;
  late BehaviorSubject<List<ExamElement>> _stream;

  @override
  void initState() {
    if (mounted)
      setState(() {
        _stream = BehaviorSubject();
        _stream.addStream(store.dataStore
            .box<ExamElement>()
            .query((ExamElement_.tag).equals('quiz'))
            .watch(triggerImmediately: true)
            .map((query) => query.find()));
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          // ignore: prefer_const_constructors
          title: Text(
            ValueString.quiz,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        body: StreamBuilder(
            stream: _stream,
            builder: (context, AsyncSnapshot<List<ExamElement>> snapshot) {
              if (snapshot.hasData &&
                  !store.dataStore.box<ExamElement>().isEmpty())
                // ignore: curly_braces_in_flow_control_structures
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(buildWidth(context) * 0.022),
                        child: Material(
                            elevation: 5,
                            shape: Shape.rectangleBorder20,
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/' +
                                      '${snapshot.data![index].exam_id}' +
                                      '.png',
                                ),
                              ),
                              contentPadding:
                                  EdgeInsets.all(buildWidth(context) * 0.048),
                              onTap: () {
                                NavigatorClass().navigateToTestCategoriesList(
                                    context,
                                    ['Mock Tests'],
                                    true,
                                    snapshot.data![index].exam_id!,
                                    snapshot.data![index].exam_name!);
                              },
                              title: Padding(
                                padding:
                                    EdgeInsets.all(buildWidth(context) * 0.02),
                                child: Text(snapshot.data![index].exam_name!),
                              ),
                              subtitle: (snapshot.data![index].exam_title_2 !=
                                      null)
                                  ? (snapshot.data![index].exam_title_2 != "")
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                              left: buildWidth(context) * 0.02),
                                          child: Text(snapshot
                                              .data![index].exam_title_2!),
                                        )
                                      : null
                                  : null,
                            )),
                      );
                    });
              return Center(
                child: Image(
                  image: new AssetImage(
                    AssetsConstant.spinnerGif,
                  ),
                ),
              );
            }));
  }
}
