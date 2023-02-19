import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:voting_app/pages/registration/registration_controller.dart';
import 'package:voting_app/pages/registration/_registration_view1.dart';

class RegistrationView extends StatelessWidget {
  RegistrationController _cont = Get.put(RegistrationController());
  static const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  static const cnicRegex = r"""^[0-9]{5}-[0-9]{7}-[0-9]{1}$""";
  static const mobRejex = r"""[0-9]{11}$""";
  TextEditingController _password = TextEditingController();
  TextEditingController _re_password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var formkey = _formKey;

    final height = MediaQuery.of(context).size.height;
    return Obx(
      () => Scaffold(
        body: SafeArea(
          key: formkey,
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
                            text: 'Registration',
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
                            SizedBox(
                              height: 80,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Full Name",
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
                                      hintText: "Full Name",
                                      suffixIcon: Icon(
                                        FontAwesomeIcons.user,
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
                                      _cont.registrationModal.full_name = value;
                                    },
                                  ),
                                  Visibility(
                                    visible: _cont.full_nameError.isNotEmpty,
                                    child: Text(
                                      _cont.full_nameError.value,
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
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
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.start,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: "CNIC",
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
                                      _cont.registrationModal.cnic = value;
                                    },
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
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Mother Name",
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
                                      hintText: "Mother Name",
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
                                      _cont.registrationModal.mother_name =
                                          value;
                                    },
                                  ),
                                  Visibility(
                                    visible: _cont.mother_nameError.isNotEmpty,
                                    child: Text(
                                      _cont.mother_nameError.value,
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
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
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.start,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: "Mother CNIC",
                                      suffixIcon: Icon(
                                        FontAwesomeIcons.idCard,
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
                                      _cont.registrationModal.mother_cnic =
                                          value;
                                    },
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
                                      hintText: "Email",
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
                                      _cont.registrationModal.email = value;
                                    },
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
                                    controller: _password,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: "Password",
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
                                      _cont.registrationModal.password = value;
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
                                  TextFormField(
                                    controller: _re_password,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: "Re-Password",
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
                                      _cont.registrationModal.re_password =
                                          value;
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
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Address",
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
                                      hintText: "Address",
                                      suffixIcon: Icon(
                                        FontAwesomeIcons.mapMarked,
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
                                      _cont.registrationModal.address = value;
                                    },
                                  ),
                                  Visibility(
                                    visible: _cont.addressError.isNotEmpty,
                                    child: Text(
                                      _cont.addressError.value,
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Mobile No.",
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
                                      hintText: "Mobile No.",
                                      suffixIcon: Icon(
                                        FontAwesomeIcons.phone,
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
                                      _cont.registrationModal.mobile = value;
                                    },
                                  ),
                                  Visibility(
                                    visible: _cont.mobileError.isNotEmpty,
                                    child: Text(
                                      _cont.mobileError.value,
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
                              if (_cont.validate()) _cont.postRegistration();
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
                        SizedBox(
                          height: 20,
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
