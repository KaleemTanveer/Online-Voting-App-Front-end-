import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:voting_app/app_routes.dart';
import 'package:voting_app/pages/login/login_controller.dart';
import 'package:local_auth/local_auth.dart';

// import 'package:voting_app/pages/login/login_view.dart';
import 'package:voting_app/pages/registration/_registration_view1.dart';

import '../registration/registration_view.dart';

class LoginView extends StatelessWidget {
  LoginController _cont = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: Container(
            height: height,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: height * .1),
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: 'Login',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.lightBlue,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Email",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.start,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: "email",
                                      suffixIcon: Icon(
                                        Icons.email,
                                        color: Colors.black54,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          15,
                                        ),
                                      ),
                                      fillColor: Color(
                                        0xfff3f3f4,
                                      ),
                                      filled: true,
                                    ),
                                    // initialValue: "kaleem@gmail.com",
                                    onChanged: ((value) {
                                      _cont.email = value;
                                    }),
                                  ),
                                  Visibility(
                                    visible: _cont.emailError.isNotEmpty,
                                    child: Text(
                                      _cont.emailError.value,
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Password",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: "password",
                                      suffixIcon: Icon(
                                        Icons.visibility,
                                        color: Colors.black54,
                                      ),
                                      // icon: Icon(Icons.lock),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          15,
                                        ),
                                      ),
                                      fillColor: Color(
                                        0xfff3f3f4,
                                      ),
                                      filled: true,
                                    ),
                                    // initialValue: "123123",
                                    onChanged: ((value) {
                                      _cont.password = value;
                                    }),
                                  ),
                                  Visibility(
                                    visible: _cont.passwordError.isNotEmpty,
                                    child: Text(
                                      _cont.passwordError.value,
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(
                            context,
                          ).size.width,
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          alignment: Alignment.center,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            onPressed: () {
                              if (_cont.validate()) _cont.login();
                            },
                            height: 50,
                            minWidth: 400,
                            color: Colors.teal,
                            child: Text(
                              "Submit",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.forgetPasswordScreen);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot Password ?',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        if (GetStorage().read("cookies") != null)
                          ElevatedButton(
                              onPressed: () {
                                _cont.login(withBio: true);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(FontAwesomeIcons.fingerprint),
                                  Text("Login with biomateric.")
                                ],
                              ).paddingAll(10)),
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Row(
                            children: const <Widget>[
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                              ),
                              Text(
                                'or',
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Divider(
                                    thickness: 2,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegistrationView(),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            padding: EdgeInsets.all(
                              15,
                            ),
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  'Don\'t have an account ?',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Color(
                                      0xFF0389F6,
                                    ),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
