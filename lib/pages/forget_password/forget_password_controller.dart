import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:voting_app/pages/login/login_view.dart';

class ForgetPasswordController extends GetxController {
  static const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  static const cnicRegex = r"""^[0-9]{5}-[0-9]{7}-[0-9]{1}$""";
  String email = '';
  String cnic = '';
  String mother_cnic = '';
  String password = '';
  String re_password = '';
  RxString cnicError = "".obs;
  RxString mother_cnicError = "".obs;
  RxString emailError = "".obs;
  RxString passwordError = "".obs;
  RxString re_passwordError = "".obs;

  postForgetPaaword() async {
    print(email);
    print(cnic);
    print(mother_cnic);
    print(password);
    final response =
        await http.post(Uri.parse('http://192.168.254.112:8000/forget-password'),
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/x-www-form-urlencoded",
            },
            body: {
              'email': email,
              'cnic': cnic,
              'mother_cnic': mother_cnic,
              'password': password,
            },
            encoding: Encoding.getByName("utf-8"));
    if (response.statusCode != 200) {
      Get.defaultDialog(middleText: "Something is wrong! Please try again.");
      return;
    }
    await Get.defaultDialog(middleText: "Password changed");
    Get.back();
  }

  validate() {
    bool isOk = true;

    if (RegExp(cnicRegex).hasMatch(cnic)) {
      isOk = false;
      cnicError.value = "Enter Your cnic";
    } else if (cnic.isEmpty) {
      isOk = false;
      cnicError.value = "field cannot be empty";
    }

    if (RegExp(cnicRegex).hasMatch(mother_cnic)) {
      isOk = false;
      mother_cnicError.value = "Enter your Mother Cnic";
    } else if (mother_cnic.isEmpty) {
      isOk = false;
      mother_cnicError.value = "field cannot be empty";
    }

    if (!RegExp(emailRegex).hasMatch(email)) {
      isOk = false;
      emailError.value = "Enter your email";
    } else if (email.isEmpty) {
      isOk = false;
      emailError.value = "field cannot be empty";
    }

    if (password == null || password.isEmpty) {
      isOk = false;
      passwordError.value = "field cannot be empty";
    } else if (password.length < 6) {
      isOk = false;
      passwordError.value = "must be at least 6 chars";
    }

    if (re_password == false || re_password.isEmpty) {
      isOk = false;
      re_passwordError.value = "field cannot be empty";
    } else if (re_password.length < 6) {
      isOk = false;
      re_passwordError.value = "must be at least 6 chars";
    } else if (re_password != password) {
      isOk = false;
      re_passwordError.value = "Enter same password";
    }

    return isOk;
  }

  @override
  void onInit() async {
    // RegistrationData(name, email, password);
    super.onInit();
  }
}
