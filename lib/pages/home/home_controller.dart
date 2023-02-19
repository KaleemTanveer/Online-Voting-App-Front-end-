import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:voting_app/app_routes.dart';
import 'package:voting_app/pages/login/login_view.dart';

import '../login/login_view.dart';
// import 'package:voting_app/pages/login/login_view.dart';

class HomeController extends GetxController {
  logout() async {
    final response = await http.get(Uri.parse('http://192.168.254.112:8000/logout'),
        headers: {"Cookie": GetStorage().read('cookies')});
    if (response.statusCode == 200) {
      await response.headers;
      GetStorage().erase();
      Get.offAllNamed(AppRoutes.loginScreen);
      return;
    }
  }

  @override
  void onInit() async {
    super.onInit();
  }
}
