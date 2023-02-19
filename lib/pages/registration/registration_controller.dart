import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:voting_app/pages/login/login_view.dart';
// import 'package:voting_app/pages/login/login_view.dart';
import '../../models/registration_models.dart';
import '../login/login_view.dart';

class RegistrationController extends GetxController {
  static const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  static const cnicRegex = r"""^[0-9]{5}-[0-9]{7}-[0-9]{1}$""";
  static const mobRejex = r"""[0-9]{11}$""";
  RxString full_nameError = "".obs;
  RxString cnicError = "".obs;
  RxString mother_nameError = "".obs;
  RxString mother_cnicError = "".obs;
  RxString emailError = "".obs;
  RxString passwordError = "".obs;
  RxString re_passwordError = "".obs;
  RxString addressError = "".obs;
  RxString mobileError = "".obs;

  RegistrationModal registrationModal = RegistrationModal();
  postRegistration() async {
    print(registrationModal.toMap());
    final response =
        await http.post(Uri.parse('http://192.168.254.112:8000/registration'),
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/x-www-form-urlencoded"
            },
            body: (registrationModal.toMap()),
            encoding: Encoding.getByName("utf-8"));
    if (response.statusCode != 200) {
      mobileError.value = "User Already Registred";
      return;
    } else
      print("Api Succcess");
    Get.to(LoginView());
  }

  validate() {
    print("object");
    bool isOk = true;
    if (registrationModal.full_name == null ||
        registrationModal.full_name.isEmpty) {
      isOk = false;
      full_nameError.value = "field cannot be empty";
      // return "field cannot be empty";
    } else if (registrationModal.full_name.length < 3) {
      isOk = false;
      full_nameError.value = "must be at least 3 chars";
      // return "must be at least 3 chars";
    }

    if (RegExp(cnicRegex).hasMatch(registrationModal.cnic)) {
      isOk = false;
      cnicError.value = "Enter Your cnic";
    } else if (registrationModal.cnic.isEmpty) {
      isOk = false;
      cnicError.value = "field cannot be empty";
      // return "field cannot be empty";
    }

    if (registrationModal.mother_name == null ||
        registrationModal.mother_name.isEmpty) {
      isOk = false;
      mother_nameError.value = "field cannot be empty";
      // return "field cannot be empty";
    } else if (registrationModal.mother_name.length < 3) {
      isOk = false;
      mother_nameError.value = "must be at least 3 chars";
      // return "must be at least 3 chars";
    }

    if (RegExp(cnicRegex).hasMatch(registrationModal.mother_cnic)) {
      isOk = false;
      mother_cnicError.value = "Enter your Mother Cnic";
    } else if (registrationModal.mother_cnic.isEmpty) {
      isOk = false;
      mother_cnicError.value = "field cannot be empty";
      // return "field cannot be empty";
    }

    if (!RegExp(emailRegex).hasMatch(registrationModal.email)) {
      isOk = false;
      emailError.value = "Enter your email1";
    } else if (registrationModal.email.isEmpty) {
      isOk = false;
      emailError.value = "field cannot be empty";
      // return "field cannot be empty";
    }

    if (registrationModal.password == null ||
        registrationModal.password.isEmpty) {
      isOk = false;
      passwordError.value = "field cannot be empty";
      // return "field cannot be empty";
    } else if (registrationModal.password.length < 6) {
      isOk = false;
      passwordError.value = "must be at least 6 chars";
      // return "must be at least 6 chars";
    }

    if (registrationModal.re_password == null ||
        registrationModal.re_password.isEmpty) {
      isOk = false;
      re_passwordError.value = "field cannot be empty";
      // return "field cannot be empty";
    } else if (registrationModal.re_password.length < 6) {
      isOk = false;
      re_passwordError.value = "must be at least 6 chars";
      // return "must be at least 6 chars";
    } else if (registrationModal.re_password != registrationModal.password) {
      isOk = false;
      re_passwordError.value = "Enter same password";
      // return "Enter same password";
    }

    if (registrationModal.address == null ||
        registrationModal.address.isEmpty) {
      isOk = false;
      addressError.value = "field cannot be empty";
      // return "field cannot be empty";
    } else if (registrationModal.address.length < 6) {
      isOk = false;
      addressError.value = "must be at least 6 chars";
      // return "must be at least 6 chars";
    }

    if (!RegExp(mobRejex).hasMatch(registrationModal.mobile)) {
      isOk = false;
      mobileError.value = "Enter your mobile number";
    } else if (registrationModal.mobile.isEmpty) {
      mobileError.value = "Enter your mobile number";
      isOk = false;

      mobileError.value = "field cannot be empty";
      // return "field cannot be empty";
    }
    return isOk;
  }

  @override
  void onInit() async {
    // RegistrationData(name, email, password);
    super.onInit();
  }
}
