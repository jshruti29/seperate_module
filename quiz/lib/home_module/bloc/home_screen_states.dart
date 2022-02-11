// import 'package:career_lift_mobile_app/common/model/get_app_info_model.dart';
// import 'package:career_lift_mobile_app/screens/home_module/model/app_check_version_model.dart';
// import 'package:career_lift_mobile_app/screens/home_module/model/app_permission_access_model.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz/common/model/client_data_model.dart';
import 'package:quiz/home_module/model/app_check_version_model.dart';
import 'package:quiz/home_module/model/app_permission_access_model.dart';

abstract class HomeScreenStates extends Equatable {}

class HomeScreenInitialState extends HomeScreenStates {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AppCheckVersionLoadingState extends HomeScreenStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AppCheckVersionLoadedState extends HomeScreenStates {
  final AppCheckVersionModel? appCheckVersionModel;

  AppCheckVersionLoadedState({this.appCheckVersionModel});
  @override
  // TODO: implement props
  List<Object?> get props => [appCheckVersionModel];
}

class AppCheckVersionErrorState extends HomeScreenStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetAppConfigLoadingState extends HomeScreenStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetAppConfigLoadedState extends HomeScreenStates {
  final AppCheckVersionModel? appCheckVersionModel;

  GetAppConfigLoadedState({this.appCheckVersionModel});
  @override
  // TODO: implement props
  List<Object?> get props => [appCheckVersionModel];
}

class GetAppConfigErrorState extends HomeScreenStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchHomeDataLoadedState extends HomeScreenStates {
  final List<HomeElements>? tempData;
  final List<String>? permissions;

  FetchHomeDataLoadedState({this.tempData, this.permissions});
  @override
  // TODO: implement props
  List<Object?> get props => [tempData, permissions];
}

class AppUserPermissionAccessLoadingState extends HomeScreenStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class AppUserPermissionAccessLoadedState extends HomeScreenStates {
  AppPermissionAccessModel appPermissionAccessModel;

  AppUserPermissionAccessLoadedState({required this.appPermissionAccessModel});
  @override
  // TODO: implement props
  List<Object?> get props => [appPermissionAccessModel];
}

class AppUserPermissionAccessErrorState extends HomeScreenStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
