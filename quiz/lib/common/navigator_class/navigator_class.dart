// import 'package:fluttertoast/fluttertoast.dart';

// import '/common/Screens/common_exam_completed_screen.dart';
// import '/common/Screens/common_exam_instruction_screen.dart';
// import '/common/Screens/common_sub_categories_list_screen.dart';
// import '/common/Screens/common_test_already_attempted_screen.dart';
// import '/common/Screens/common_test_categories_list_screen.dart';
// import '/common/Screens/common_test_result_screen.dart';
// import '/common/Screens/knowledge_zone_html_viewer.dart';
// import '/common/bloc/common_api_bloc.dart';
// import '/common/model/submit_test_result_model.dart';
// import '/common/repository/common_api_repository.dart';
// import '/screens/about_us_module/bloc/about_us_bloc.dart';
// import '/screens/about_us_module/repository/about_us_repository.dart';
// import '/screens/about_us_module/screens/about_us_screen.dart';
// import '/screens/bookmark_module/screens/mobile/bookmark_screen.dart';
// import '/screens/bookmark_module/widgets/html_text_viewer.dart';
// import '/screens/current_affairs_module/bloc/current_affairs_bloc.dart';
// import '/screens/current_affairs_module/repository/current_affairs_repository.dart';
// import '/screens/current_affairs_module/screens/mobile/current_affairs_screen.dart';
// import '/screens/educational_discussion_module/bloc/educational_discussion_bloc.dart';
// import '/screens/educational_discussion_module/repository/educational_discussion_repository.dart';
// import '/screens/educational_discussion_module/screens/mobile/edu_discussion_info_screen.dart';
// import '/screens/educational_discussion_module/screens/mobile/edu_discussion_new_post_screen.dart';
// import '/screens/educational_discussion_module/screens/mobile/edu_discussion_post_screen.dart';
// import '/screens/educational_discussion_module/screens/mobile/edu_discussion_post_view.dart';
// import '/screens/educational_discussion_module/screens/mobile/educational_discussion_screen.dart';
// import '/screens/exams_module/screens/mobile/exam_result_analysis_screen.dart';
// import '/screens/exams_module/screens/mobile/exams_all_questions_screen.dart';
// import '/screens/exams_module/screens/mobile/exams_screen.dart';
// import '/screens/exams_module/screens/mobile/exams_sub_screen.dart';
// import '/screens/exams_module/screens/mobile/sub_category_exam_screen.dart';
// import '/screens/full_length_test_module/bloc/full_length_test_screen_bloc.dart';
// import '/screens/full_length_test_module/model/fetch_flt_result_model.dart';
// import '/screens/full_length_test_module/repository/full_length_test_screen_repository.dart';
// import '/screens/full_length_test_module/screens/mobile/flt_instruction_screen.dart';
// import '/screens/full_length_test_module/screens/mobile/flt_questions_screen.dart';
// import '/screens/full_length_test_module/screens/mobile/flt_result_analysis_screen.dart';
// import '/screens/full_length_test_module/screens/mobile/flt_test_completed_screen.dart';
// import '/screens/full_length_test_module/screens/mobile/flt_test_list_screen.dart';
// import '/screens/full_length_test_module/screens/mobile/full_length_test_screen.dart';
// import '/screens/home_module/bloc/home_screen_bloc.dart';
// import '/screens/home_module/repository/home_screen_repository.dart';
// import '/screens/home_module/screens/mobile/home_screen.dart';
// import '/screens/institute_notification_module/bloc/institute_notification_bloc.dart';
// import '/screens/institute_notification_module/repository/institute_notification_repository.dart';
// import '/screens/institute_notification_module/screens/mobile/add_post_institute_notification_screen.dart';
// import '/screens/institute_notification_module/screens/mobile/institute_notification_screen.dart';
// import '/screens/knowledge_zone_module/bloc/knowledge_zone_bloc.dart';
// import '/screens/knowledge_zone_module/repository/knowledge_zone_repository.dart';
// import '/screens/knowledge_zone_module/screens/mobile/knowledge_zone_prereading_screen.dart';
// import '/screens/knowledge_zone_module/screens/mobile/knowledge_zone_screen.dart';
// import '/screens/knowledge_zone_module/screens/mobile/learn_english_screen.dart';
// import '/screens/knowledge_zone_module/screens/mobile/vocabulary_screen.dart';
// import '/screens/landing_module/screens/mobile/explore_module/explore_screen.dart';
// import '/screens/landing_module/screens/mobile/welcome_screen.dart';
// import '/screens/live_classes_module/bloc/live_classes_screen_bloc.dart';
// import '/screens/live_classes_module/repository/live_classes_repository.dart';
// import '/screens/live_classes_module/screens/mobile/live_classes_screen.dart';
// import '/screens/login_module/bloc/login_screen_bloc.dart';
// import '/screens/login_module/repository/login_screen_repository.dart';
// import '/screens/login_module/screens/mobile/login_screen.dart';
// import '/screens/menu_module/bloc/clear_data_bloc.dart';
// import '/screens/menu_module/repository/clear_data_repository.dart';
// import '/screens/menu_module/screens/mobile/app_update_and_expiry_screen.dart';
// import '/screens/menu_module/screens/mobile/setting_screen.dart';
// import '/screens/pay_module/bloc/pay_screen_bloc.dart';
// import '/screens/pay_module/repository/pay_screen_repository.dart';
// import '/screens/pay_module/screens/pay_screen.dart';
// import '/screens/profile_module/screens/mobile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/common/Screens/common_exam_completed_screen.dart';
import 'package:quiz/common/Screens/common_exam_instruction_screen.dart';
import 'package:quiz/common/Screens/common_test_already_attempted_screen.dart';
import 'package:quiz/common/Screens/common_test_categories_list_screen.dart';
import 'package:quiz/common/Screens/common_test_result_screen.dart';
import 'package:quiz/common/Screens/knowledge_zone_html_viewer.dart';
import 'package:quiz/common/bloc/common_api_bloc.dart';
import 'package:quiz/common/repository/common_api_repository.dart';
import 'package:quiz/quiz_module/screens/mobile/quiz_all_questions_screen.dart';
import 'package:quiz/quiz_module/screens/mobile/quiz_screen.dart';

import '../../exams_all_questions_screen.dart';
import '../../pdf_viewer_page_widget.dart';

// import '/screens/register_module/register_module/bloc/signup_screen_bloc.dart';
// import '/screens/register_module/register_module/repository/signup_screen_repository.dart';
// import '/screens/register_module/register_module/signup_screen.dart';
// import '/screens/study_zone_module/bloc/study_zone_bloc.dart';
// import '/screens/study_zone_module/repository/study_zone_repository.dart';
// import '/screens/study_zone_module/screens/mobile/study_content_screen.dart';
// import '/screens/study_zone_module/screens/mobile/study_zone_screen.dart';
// import '/screens/study_zone_module/widgets/pdf_viewer_page_widget.dart';
// import '/screens/study_zone_module/widgets/video_player_page_widget.dart';
// import '/screens/user_details_module/screens/user_details_screen.dart';
// import '/screens/user_details_module/screens/user_update_details_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class NavigatorClass {
//   Future navigateToWelcomeScreen(BuildContext context) {
//     return Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
//   }

//   Future navigateToExploreScreen(BuildContext context) {
//     return Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => ExploreScreen()));
//   }

//   Future navigateToLoginScreen(BuildContext context) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                 create: (context) => LoginScreenBloc(
//                     loginScreenRepository: LoginScreenRepositoryImpl()),
//                 child: LoginScreen())));
//   }

//   Future navigateToRegisterScreen(BuildContext context) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                 create: (context) => SignUpScreenBloc(
//                     signUpScreenRepository: SignUpScreenRepositoryImpl()),
//                 child: SignUpScreen())));
//   }

//   Future navigateToUserDetailsScreen(BuildContext context) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                 create: (context) => SignUpScreenBloc(
//                     signUpScreenRepository: SignUpScreenRepositoryImpl()),
//                 child: UserDetailsScreen())));
//   }

  // Future navigateToProfileScreen(BuildContext context) {
  //   return Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => ProfileScreen()));
  // }

//   Future navigateToUserProfileUpdateScreen(BuildContext context) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                 create: (context) => SignUpScreenBloc(
//                     signUpScreenRepository: SignUpScreenRepositoryImpl()),
//                 child: UserUpdateDetailsScreen())));
//   }

//   Future navigateToBookmarkScreen(BuildContext context) {
//     return Navigator.push(
//         context, MaterialPageRoute(builder: (context) => BookmarkScreen()));
//   }

//   Future navigateToHTMLTextViewer(
//       BuildContext context, String title, String subtitle, String content) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => HTMLTextViewer(
//                   content: content,
//                   title: title,
//                   subtitle: subtitle,
//                 )));
//   }

//   Future navigateToHomeScreen(BuildContext context) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                 create: (context) => HomeScreenBloc(
//                     homeScreenRepository: HomeScreenRepositoryImpl()),
//                 child: HomeScreen())));
//   }

//   Future navigateToHomeScreenRemoveUntil(BuildContext context) {
//     return Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                 create: (context) => HomeScreenBloc(
//                     homeScreenRepository: HomeScreenRepositoryImpl()),
//                 child: HomeScreen())),
//         (route) => false);
//   }

//   Future navigateToAppUpdateAndExpiryScreen(
//       BuildContext context, isAppExpireValue) {
//     return Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(
//             builder: (context) => AppUpdateAndExpiryScreen(
//                   isAppExpire: isAppExpireValue,
//                 )),
//         (route) => false);
//   }

//   Future navigateToPayScreen(BuildContext context) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                 create: (context) => PayScreenBloc(
//                     payScreenRepository: PayScreenRepositoryImpl()),
//                 child: PayScreen())));
//   }

//   Future navigateToCurrentAffairsScreen(BuildContext context) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                   create: (context) => CurrentAffairsBloc(
//                       repository: CurrentAffairsRepositoryImpl()),
//                   child: CurrentAffairsPage(),
//                 )));
//   }

//   Future navigateToStudyContentScreen(
//       BuildContext context, String name, List content, bool isVideoSection) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => StudyContentScreen(
//                 isVideoSection: !isVideoSection,
//                 name: name,
//                 content: content)));
//   }

//   Future navigateToVideoPlayerPage(
//       BuildContext context, String title, String desc, String url) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => VideoPlayerPage(
//                   url: url,
//                   desc: desc,
//                   title: title,
//                 )));
//   }

  Future navigateToPDFViewerPage(
      BuildContext context, String title, String desc, String url) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PDFViewerPage(
                  url: url,
                  desc: desc,
                  title: title,
                )));
  }

  Future navigateToExamInstructionScreen(
      BuildContext context,
      isQuiz,
      id,
      negativeMark,
      totalQues,
      positiveMark,
      totalTime,
      testName,
      title,
      testHash,
      {isAttempted}) {
    print("exam without sub $isQuiz + $id"
        " +$negativeMark + $totalQues + $positiveMark"
        " + $totalTime + $testName+ $title + $testHash");

    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CommonExamInstructionScreen(
                isQuiz: isQuiz,
                id: id,
                incorrectMarks: negativeMark,
                totalQues: totalQues,
                correctMarks: positiveMark,
                totalTime: totalTime,
                heading: testName!,
                title: title,
                testHash: testHash!,
                isAttempted: isAttempted)));
  }

//   Future navigateToSubExamInstructionScreen(
//       BuildContext context,
//       isQuiz,
//       id,
//       negativeMark,
//       totalQues,
//       positiveMark,
//       totalTime,
//       testName,
//       title,
//       testHash,
//       {isAttempted}) {
//     print("exam sub category $isQuiz + $id"
//         " +$negativeMark + $totalQues + $positiveMark"
//         " + $totalTime + $testName+ $title + $testHash");
//     return Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//             builder: (context) => CommonExamInstructionScreen(
//                 isQuiz: isQuiz,
//                 id: id,
//                 incorrectMarks: negativeMark,
//                 totalQues: totalQues,
//                 correctMarks: positiveMark,
//                 totalTime: totalTime,
//                 heading: testName!,
//                 title: title,
//                 testHash: testHash!,
//                 isAttempted: isAttempted)));
//   }

  Future navigateToTestAlreadyAttemptedScreen(
      BuildContext context,
      isQuiz,
      id,
      negativeMark,
      totalQues,
      positiveMark,
      totalTime,
      testName,
      title,
      testHash,
      totalMark) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => CommonApiBloc(
                    commonApiRepository: CommonApiRepositoryImpl()),
                child: TestAlreadyAttemptedScreen(
                  isQuiz: isQuiz,
                  id: id,
                  incorrectMarks: negativeMark,
                  totalQues: totalQues,
                  correctMarks: positiveMark,
                  totalTime: totalTime,
                  heading: testName!,
                  title: title,
                  test_hash: testHash!,
                  totalMark: totalMark,
                ))));
  }

  Future navigateToTestAlreadyAttemptedScreenRemovePrevious(
      BuildContext context,
      isQuiz,
      id,
      negativeMark,
      totalQues,
      positiveMark,
      totalTime,
      testName,
      title,
      testHash,
      totalMark) {
    return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => CommonApiBloc(
                    commonApiRepository: CommonApiRepositoryImpl()),
                child: TestAlreadyAttemptedScreen(
                  isQuiz: isQuiz,
                  id: id,
                  incorrectMarks: negativeMark,
                  totalQues: totalQues,
                  correctMarks: positiveMark,
                  totalTime: totalTime,
                  heading: testName!,
                  title: title,
                  test_hash: testHash!,
                  totalMark: totalMark,
                ))));
  }

  Future navigateToQuizAllQuestionsScreen(
      BuildContext context,
      id,
      correctMarks,
      incorrectMarks,
      totalQues,
      heading,
      testHash,
      totalTime,
      isAlreadyAttempt) {
    return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => CommonApiBloc(
                    commonApiRepository: CommonApiRepositoryImpl()),
                child: QuizAllQuestionsScreen(
                  id: id,
                  positiveMarks: correctMarks,
                  negativeMarks: incorrectMarks,
                  totalMarks:
                      double.parse(totalQues) * double.parse(correctMarks),
                  title: heading,
                  testHash: testHash,
                  totalTime: totalTime,
                  isAlreadyAttempt: isAlreadyAttempt,
                  totalQuestion: totalQues,
                ))));
  }

  navigateToExamsAllQuestionsScreen(
    BuildContext context,
    id,
    correctMarks,
    incorrectMarks,
    totalQues,
    heading,
    testHash,
    totalTime,
    isAttempted,
  ) {
    if (totalQues.toString() == "") {
      return Navigator.of(context).pop();
    } else {
      return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                  create: (context) => CommonApiBloc(
                      commonApiRepository: CommonApiRepositoryImpl()),
                  child: ExamsAllQuestionsScreen(
                    id: id,
                    positiveMarks: correctMarks,
                    negativeMarks: incorrectMarks,
                    totalMarks: 40.0,
                    title: heading,
                    testHash: testHash,
                    totalTime: totalTime,
                    isAttempted: isAttempted,
                    totalQuestion: totalQues,
                  ))));
    }
  }

  Future navigateToTestResultScreen(BuildContext context, isQuiz, totalMarks,
      data, positiveMarks, negativeMarks, result, testHash) {
    return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => CommonApiBloc(
                    commonApiRepository: CommonApiRepositoryImpl()),
                child: TestResultScreen(
                    isQuiz: isQuiz,
                    totalMarks: totalMarks,
                    quesIDList: data,
                    positiveMarks: positiveMarks,
                    negativeMarks: negativeMarks,
                    colorData: result,
                    testHash: testHash))));
  }

//   Future navigateToAboutUsScreen(BuildContext context) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => MultiBlocProvider(
//             providers: [
//               BlocProvider(
//                 create: (context) =>
//                     AboutUsBloc(aboutUsRepository: AboutUsRepositoryImpl()),
//               ),
//               BlocProvider(
//                 create: (context) => GalleryContentBloc(
//                     aboutUsRepository: AboutUsRepositoryImpl()),
//               ),
//             ],
//             child: AboutUsPage(),
//           ),
//         ));
//   }

//   Future navigateToExamScreen(BuildContext context) {
//     return Navigator.push(
//         context, MaterialPageRoute(builder: (context) => ExamsScreen()));
//   }

//   Future navigateToExamSubScreen(BuildContext context, List<dynamic> list) {
//     return Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ExamsSubScreen(examList: list),
//       ),
//     );
//   }

  Future navigateToQuizScreen(BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => QuizScreen()));
  }

//   navigateToFullLengthTestScreen(BuildContext context) {
//     return Navigator.push(context,
//         MaterialPageRoute(builder: (context) => FullLengthTestScreen()));
//   }

//   navigateToLiveClassesScreen(BuildContext context) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                 create: (context) => LiveClassesScreenBloc(
//                     liveClassesScreenRepository:
//                         LiveClassesScreenRepositoryImpl()),
//                 child: LiveClassesScreen())));
//   }

//   navigateToKnowledgeZoneScreen(BuildContext context) {
//     return Navigator.push(context,
//         MaterialPageRoute(builder: (context) => KnowledgeZoneScreen()));
//   }

//   navigateToInstituteBatchManagementScreen(BuildContext context) {}

//   navigateToKnowledgeZoneLearnEnglishScreen(
//       BuildContext context, tab1, tab2, tab3, title) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                 create: (context) => KnowledgeZoneBloc(
//                     repository: KnowledgeZoneRepositoryImpl()),
//                 child: LearnEnglishScreen(
//                   tab1: tab1,
//                   tab2: tab2,
//                   tab3: tab3,
//                   title: title,
//                 ))));
//   }

//   navigateToKnowledgeZonePreReadingScreen(
//       BuildContext context, title, category) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                 create: (context) => KnowledgeZoneBloc(
//                     repository: KnowledgeZoneRepositoryImpl()),
//                 child: KnowledgeZonePreReadingScreen(
//                   title: title,
//                   category: category,
//                 ))));
//   }

//   navigateToVocabularyScreen(BuildContext context, tab1, tab2, title) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                 create: (context) => KnowledgeZoneBloc(
//                     repository: KnowledgeZoneRepositoryImpl()),
//                 child: VocabularyScreen(
//                   tab1: tab1,
//                   tab2: tab2,
//                   title: title,
//                 ))));
//   }

//   Future navigateToInstituteNotificationScreen(BuildContext context) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                 create: (context) => InstituteNotificationBloc(
//                     instituteNotificationRepository:
//                         InstituteNotificationRepositoryImpl()),
//                 child: InstituteNotificationScreen())));
//   }

//   navigateToStudyZoneScreen(BuildContext context) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => MultiBlocProvider(
//                   providers: [
//                     BlocProvider(
//                       create: (context) =>
//                           StudyZoneBloc(repository: StudyZoneRepositoryImpl()),
//                     ),
//                     BlocProvider(
//                       create: (context) => CurrentAffairsBloc(
//                           repository: CurrentAffairsRepositoryImpl()),
//                     ),
//                   ],
//                   child: StudyZoneScreen(),
//                 )));
//   }

//   navigateToEducationalDiscussionScreen(BuildContext context) {
//     Navigator.push(context,
//         MaterialPageRoute(builder: (context) => EducationalDiscussionScreen()));
//   }

//   Future navigateToFltTestListScreen(
//       BuildContext context, isHindi, name, examId, examId2) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                 create: (context) => FullLengthTestScreenBloc(
//                     fullLengthTestScreenRepository:
//                         FullLengthTestScreenRepositoryImpl()),
//                 child: FltTestListScreen(
//                     isHindi: isHindi ? true : false,
//                     title: name,
//                     examId: examId,
//                     examId2:  examId2))));
//   }

//   Future navigateToFltTestListScreenExit(
//       BuildContext context, isHindi, name, examId, examId2) {
//     return Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                 create: (context) => FullLengthTestScreenBloc(
//                     fullLengthTestScreenRepository:
//                     FullLengthTestScreenRepositoryImpl()),
//                 child: FltTestListScreen(
//                     isHindi: isHindi ? true : false,
//                     title: name,
//                     examId: examId,
//                     examId2: examId2))) ,  (route) => false);
//   }

//   Future navigateToFltInstructionScreen(
//       BuildContext context,
//       isHindi,
//       positiveMark,
//       totalQues,
//       testName,
//       testReqPer,
//       negativeMark,
//       testId,
//       title,
//       totalTime , examId , examId2) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                 create: (context) => FullLengthTestScreenBloc(
//                     fullLengthTestScreenRepository:
//                         FullLengthTestScreenRepositoryImpl()),
//                 child: FltInstructionScreen(
//                     isHindi: isHindi,
//                     correctMarks: positiveMark,
//                     totalQues: totalQues,
//                     heading: testName,
//                     reqPercentage: testReqPer,
//                     incorrectMarks: negativeMark,
//                     testId: testId,
//                     title: title,
//                     totalTime: totalTime, examId: examId, examId2: examId2,))));
//   }

  void navigateToTestCategoriesList(context, tabs, isQuiz, examId, examName) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TestCategoriesListScreen(
                isQuiz: isQuiz, tabs: tabs, examId: examId, title: examName)));
  }

//   void navigateToSubTestCategoriesList(
//       BuildContext context, String examName, List<dynamic> subCategoryList) {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => TestCategoriesSUbListScreen(
//                   title: examName,
//                   getList: subCategoryList,
//                 )));
//   }

//   void navigateSubToTestCategoriesList(context, examId, examName, tab) {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => TestSubCategoriesListScreen(
//                   examId: examId,
//                   title: examName,
//                   tabs: tab,
//                 )));
//   }

  void navigateToKnowledgeZoneHtmlViewer(context, dataHash, subTitle, title) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => CommonApiBloc(
                    commonApiRepository: CommonApiRepositoryImpl()),
                child: KnowledgeZoneHtmlTextViewer(
                    dataHash: dataHash, subtitle: subTitle, title: title))));
  }

//   Future navigateToSettingsScreen(BuildContext context) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => MultiBlocProvider(
//             providers: [
//               BlocProvider(
//                 create: (context) => HomeScreenBloc(
//                     homeScreenRepository: HomeScreenRepositoryImpl()),
//               ),
//               BlocProvider(
//                 create: (context) => ClearDataBloc(
//                     clearDataRepository: ClearDataRepositoryImpl()),
//               ),
//             ],
//             child: SettingScreen(),
//           ),
//         ));
//   }

//   navigateToDetailsOfModule(BuildContext context, String element) {
//     switch (element) {
//       case '230':
//         // return CommunityPage();
//         return navigateToEducationalDiscussionScreen(context);
//       case '373':
//         // return StudyZoneScreen();
//         return navigateToStudyZoneScreen(context);
//       case '456':
//         return navigateToCurrentAffairsScreen(context);
//       case '229':
//         // return KnowledgeZoneScreen();
//         return navigateToKnowledgeZoneScreen(context);
//       case '225':
//         // return ExamScreen();
//         return navigateToExamScreen(context);
//       case '226':
//         // return QuizScreen();
//         return navigateToQuizScreen(context);
//       case '331':
//         // return FullLengthTestScreen();
//         return navigateToFullLengthTestScreen(context);
//       case '467':
//         // return LiveClassesScreen();
//         return navigateToLiveClassesScreen(context);
//       case '237':
//         return navigateToAboutUsScreen(context);
//       case '370':
//         //return InstituteNotiPage();
//         return navigateToInstituteNotificationScreen(context);
//       case '234':
//         return navigateToPayScreen(context);
//       case '357':
//         //return InstituteBatchManagement();
//         return navigateToInstituteBatchManagementScreen(context);
//       default:
//       // return NothingToShow();
//     }
//   }

  void navigateToExamCompletedScreen(context, examResult, testHash) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ExamCompletedScreen(
                examResult: examResult, test_hash: testHash)));
  }

//   void navigateToExamResultAnalysis(context, SubmitTestResultModel examResult) {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => ExamResultAnalysisScreen(
//                   submitTestResultModel: examResult,
//                 )));
//   }

//   Future navigateToFltTestAnalysis(
//       BuildContext context, FetchFltResultModel fetchFltResultModel) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => FltResultAnalysisScreen(
//                   result: fetchFltResultModel,
//                 )));
//   }

//   Future navigateToFltTestCompletedScreen(
//       BuildContext context, String testId, String title , isHindi , examId , examId2) {
//     return Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                 create: (context) => FullLengthTestScreenBloc(
//                     fullLengthTestScreenRepository:
//                         FullLengthTestScreenRepositoryImpl()),
//                 child: FltTestCompletedScreen(test_id: testId, title: title, isHindi: isHindi, examId: examId, examId2: examId2 , ))));
//   }

//   Future navigateToFltQuestionsScreen(
//       context,
//       hasSection,
//       totalTime,
//       correctMarks,
//       incorrectMarks,
//       reqPercentage,
//       heading,
//       sectionData,
//       totalQues,
//       testId,isHindi , examId , examId2) {
//     return Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                 create: (context) => FullLengthTestScreenBloc(
//                     fullLengthTestScreenRepository:
//                         FullLengthTestScreenRepositoryImpl()),
//                 child: FltQuestionsScreen(
//                     hasSection: hasSection,
//                     totalTime: totalTime,
//                     correctMarks: correctMarks,
//                     incorrectMarks: incorrectMarks,
//                     reqPercentage: reqPercentage,
//                     title: heading,
//                     sectionData: sectionData,
//                     totalQues: totalQues,
//                     testId: testId, examId2:examId2 , examId: examId, isHindi: isHindi,

//                 ))));
//   }

//   Future navigateToEduDiscussionPostScreen(
//       BuildContext context, title, communityId) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                 create: (context) => EducationalDiscussionBloc(
//                     educationalDiscussionRepository:
//                         EducationalDiscussionRepositoryImpl()),
//                 child: EduDiscussionPostsScreen(
//                     title: title, communityID: communityId))));
//   }

//   Future navigateToEduDiscussionInfoScreen(
//       BuildContext context, title, communityId) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                 create: (context) => EducationalDiscussionBloc(
//                     educationalDiscussionRepository:
//                         EducationalDiscussionRepositoryImpl()),
//                 child: EduDiscussionInfoScreen(
//                     title: title, communityID: communityId))));
//   }

//   Future navigateToEduDiscussionNewPostScreen(
//       BuildContext context, title, groupHashTag, communityID, imagePath) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                 create: (context) => EducationalDiscussionBloc(
//                     educationalDiscussionRepository:
//                         EducationalDiscussionRepositoryImpl()),
//                 child: EduDiscussionNewPostScreen(
//                     tag: title,
//                     groupHashTag: groupHashTag,
//                     communityID: communityID,
//                     imagePath: imagePath))));
//   }

//   Future navigateToNewPostInstituteNotificationScreen(BuildContext context) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                 create: (context) => EducationalDiscussionBloc(
//                     educationalDiscussionRepository:
//                         EducationalDiscussionRepositoryImpl()),
//                 child: NewPostNotificationScreen())));
//   }

//   Future navigateToEduDiscussionPostViewScreen(BuildContext context, post) {
//     return Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                 create: (context) => EducationalDiscussionBloc(
//                     educationalDiscussionRepository:
//                         EducationalDiscussionRepositoryImpl()),
//                 child: EduDiscussionPostViewScreen(
//                   details: post,
//                 ))));
//   }
}
