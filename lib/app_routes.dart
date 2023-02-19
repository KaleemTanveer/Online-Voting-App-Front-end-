import 'package:get/get.dart';
import 'package:voting_app/pages/election_list/election_list_view.dart';
import 'package:voting_app/pages/forget_password/forget_password_view.dart';
import 'package:voting_app/pages/home/home_view.dart';
import 'package:voting_app/pages/login/login_view.dart';
import 'package:voting_app/pages/login/login_view.dart';
import 'package:voting_app/pages/registration/registration_view.dart';
// import 'package:voting_app/pages/login/login_view.dart';
import 'package:voting_app/pages/registration/_registration_view1.dart';

class AppRoutes {
  static String homeScreen = '/';
  static String loginScreen = '/loginScreen';
  static String registrationScreen = '/registrationScreen';
  static String electionListScreen = '/electionListScreen';
  static String forgetPasswordScreen = '/forgetPasswordScreen';

  static List<GetPage> pages = [
    GetPage(name: homeScreen, page: () => HomeView()),
    GetPage(name: loginScreen, page: () => LoginView()),
    GetPage(name: registrationScreen, page: () => RegistrationView()),
    GetPage(name: electionListScreen, page: () => ElectionListView()),
    GetPage(name: forgetPasswordScreen, page: () => ForgetPasswordView()),
  ];
}
