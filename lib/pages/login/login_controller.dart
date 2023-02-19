import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:local_auth/local_auth.dart';
import 'package:voting_app/app_routes.dart';

class LoginController extends GetxController {
  static const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  String email = '';
  String password = '';
  RxString emailError = "".obs;
  RxString passwordError = "".obs;

  final LocalAuthentication auth = LocalAuthentication();
  login({bool withBio = false}) async {
    if (withBio) {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
      if (authenticated) {
        dynamic response = await http.get(
          Uri.tryParse('http://192.168.254.112:8000/verify-session')!,
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
            "Cookie": GetStorage().read('cookies')
          },
        );
        if (response.statusCode != 200) {
          GetStorage().remove('cookies');
          await Get.defaultDialog(middleText: "You need to signin again.");
          return;
        } else {
          Get.offNamed(AppRoutes.homeScreen);
          return;
        }
      } else {
        await Get.defaultDialog(
            middleText:
                "Unable to verify using biomateric.\nYou can signin using ceridentials.");
        return;
      }
    }
    Map data = {
      'email': email,
      'password': password,
    };
    print(data.toString());
    final response =
        await http.post(Uri.parse('http://192.168.254.112:8000/login'),
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/x-www-form-urlencoded",
              // "Cookie": GetStorage().read('cookies')
            },
            body: data,
            encoding: Encoding.getByName("utf-8"));

    if (response.statusCode == 400) {
      print("Enter Email And password");

      return;
    } else if (response.statusCode == 404) {
      passwordError.value = "Enter correct Email And password";
      print("Enter correct Email And password");
      return;
    }
    await GetStorage().write('cookies', response.headers['set-cookie']);
    dynamic jsonData = json.decode(response.body);
    await GetStorage().write('user_email', jsonData['data']['user_email']);
    // await GetStorage().write('user_id', response.headers['set-cookie']);
    print("Login Sucessfully");
    print(response.headers['set-cookie']);
    Get.offNamed(AppRoutes.homeScreen);
    return;
  }

  validate() {
    bool isOk = true;

    if (!RegExp(emailRegex).hasMatch(email)) {
      isOk = false;
      emailError.value = "Enter your email";
    } else if (email.isEmpty) {
      isOk = false;
      emailError.value = "field cannot be empty";
    }

    if (password == false || password.isEmpty) {
      print("object");

      isOk = false;
      passwordError.value = "field cannot be empty";
    } else if (password.length < 6) {
      isOk = false;
      passwordError.value = "must be at least 6 chars";
    }

    return isOk;
  }

  @override
  void onInit() async {
    super.onInit();
  }
}
