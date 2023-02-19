import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:voting_app/pages/forget_password/forget_password_controller.dart';

import '../registration/registration_view.dart';

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordController _cont = Get.put(ForgetPasswordController());
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
                Positioned(
                  top: -height * .15,
                  right: -MediaQuery.of(context).size.width * .0,
                  child: Container(),
                ),
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
                            text: 'Forget Password',
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
                                    onChanged: (value) {
                                      _cont.email = value;
                                    },
                                    // initialValue: "kaleem@gmail.com",
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
                                    "CNIC",
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
                                      hintText: "CNIC",
                                      suffixIcon: Icon(
                                        FontAwesomeIcons.idCard,
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
                                    onChanged: (value) {
                                      _cont.cnic = value;
                                    },
                                    // initialValue: "123123",
                                  ),
                                  Visibility(
                                    visible: _cont.cnicError.isNotEmpty,
                                    child: Text(
                                      _cont.cnicError.value,
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
                                    "Mother CNIC",
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
                                      hintText: "Mother CNIC",
                                      suffixIcon: Icon(
                                        FontAwesomeIcons.idCard,
                                        color: Colors.black54,
                                      ),
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
                                    onChanged: (value) {
                                      _cont.mother_cnic = value;
                                    },
                                    // initialValue: "123123",
                                  ),
                                  Visibility(
                                    visible: _cont.mother_cnicError.isNotEmpty,
                                    child: Text(
                                      _cont.mother_cnicError.value,
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
                                    " New Password",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: "New Password",
                                      suffixIcon: Icon(
                                        FontAwesomeIcons.eye,
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
                                    onChanged: (value) {
                                      _cont.password = value;
                                    },
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
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Re-Password",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: "Re-Password",
                                      suffixIcon: Icon(
                                        FontAwesomeIcons.eyeSlash,
                                        color: Colors.black54,
                                      ),
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
                                    onChanged: (value) {
                                      _cont.re_password = value;
                                    },
                                  ),
                                  Visibility(
                                    visible: _cont.re_passwordError.isNotEmpty,
                                    child: Text(
                                      _cont.re_passwordError.value,
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
                              if (_cont.validate()) _cont.postForgetPaaword();
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
                        if (GetStorage().read("cookies") != null)
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
                                SizedBox(
                                  width: 10,
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
