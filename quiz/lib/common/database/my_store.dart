//import 'package:career_lift_mobile_app/screens/login_module/model/MobileLoginModel.dart';
import 'package:objectbox/objectbox.dart';
import 'package:quiz/common/model/database_model.dart';
import 'package:quiz/common/model/get_app_info_model.dart';
import 'package:quiz/common/model/student_permission_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:velocity_x/velocity_x.dart";

class MyStore extends VxStore {
  late Store dataStore;
}
