// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:voting_app/pages/registration/registration_controller.dart';

// class RegistrationView extends StatefulWidget {
//   @override
//   State<RegistrationView> createState() => _RegistrationViewState();
// }

// class _RegistrationViewState extends State<RegistrationView> {
//   RegistrationController _cont = Get.put(RegistrationController());
//   static const emailRegex =
//       r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
//   static const cnicRegex = r"""^[0-9]{5}-[0-9]{7}-[0-9]{1}$""";
//   static const mobRejex = r"""[0-9]{11}$""";
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   // String password = '';
//   // String repassword = '';
//   @override
//   Widget build(BuildContext context) {
//     var formkey = _formKey;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Registration"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 30),
//           child: Form(
//             key: formkey,
//             child: ListView(
//               children: [
//                 Text(
//                   "Registration",
//                   style: TextStyle(
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blueGrey,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     // hintText: "Enter your Email",
//                     labelText: "Enter your Full Name",
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "field cannot be empty";
//                     } else if (value.length < 3) {
//                       return "must be at least 3 chars";
//                     } else {
//                       return null;
//                     }
//                   },
//                   onChanged: (value) {
//                     _cont.registrationModal.full_name = value;
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     // hintText: "enter your name",
//                     labelText: "Enter your CNIC",
//                   ),
//                   validator: (value) {
//                     if (RegExp(cnicRegex).hasMatch(value!)) {
//                     } else if (value.isEmpty) {
//                       return "field cannot be empty";
//                     } else {
//                       return "CNIC is not correctly formatted";
//                     }
//                   },
//                   onChanged: (value) {
//                     _cont.registrationModal.cnic = value;
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     // hintText: "enter your name",
//                     labelText: "Enter your Mother Name",
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "field cannot be empty";
//                     } else if (value.length < 3) {
//                       return "must be at least 3 chars";
//                     } else {
//                       return null;
//                     }
//                   },
//                   onChanged: (value) {
//                     _cont.registrationModal.mother_name = value;
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     // hintText: "enter your name",
//                     labelText: "Enter your Mother CNIC",
//                   ),
//                   validator: (value) {
//                     if (RegExp(cnicRegex).hasMatch(value!)) {
//                     } else if (value.isEmpty) {
//                       return "field cannot be empty";
//                     } else {
//                       return "CNIC is not correctly formatted";
//                     }
//                   },
//                   onChanged: (value) {
//                     _cont.registrationModal.mother_cnic = value;
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     // hintText: "enter your name",
//                     labelText: "Enter your Email",
//                   ),
//                   validator: (value) {
//                     if (RegExp(emailRegex).hasMatch(value!)) {
//                     } else if (value.isEmpty) {
//                       return "field cannot be empty";
//                     } else {
//                       return "email is not correctly formatted";
//                     }
//                   },
//                   onChanged: (value) {
//                     _cont.registrationModal.email = value;
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   // onChanged: (value) {
//                   //   password = value as TextEditingController;
//                   // },
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: "Enter Your Password",
//                   ),
//                   obscureText: true,
//                   obscuringCharacter: "●",
//                   validator: (password) {
//                     if (password == null || password.isEmpty) {
//                       return "field cannot be empty";
//                     } else if (password.length < 6) {
//                       return "must be at least 6 chars";
//                     } else {
//                       return null;
//                     }
//                   },
//                   onChanged: (value) {
//                     _cont.registrationModal.password = value;
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: "Enter your re password",
//                   ),
//                   obscureText: true,
//                   obscuringCharacter: "●",
//                   onChanged: (value) {
//                     _cont.registrationModal.re_password = value;
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     // hintText: "enter your name",
//                     labelText: "Enter your Addresss",
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "field cannot be empty";
//                     } else if (value.length < 6) {
//                       return "must be at least 6 chars";
//                     } else {
//                       return null;
//                     }
//                   },
//                   onChanged: (value) {
//                     _cont.registrationModal.address = value;
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: "Enter your Mobile",
//                   ),
//                   validator: (value) {
//                     if (RegExp(mobRejex).hasMatch(value!)) {
//                     } else if (value.isEmpty) {
//                       return "field cannot be empty";
//                     } else {
//                       return "email is not correctly formatted";
//                     }
//                   },
//                   onChanged: (value) {
//                     _cont.registrationModal.mobile = value;
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     // hintText: "enter your name",
//                     labelText: "Enter your category ",
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "field cannot be empty";
//                     } else if (value.length < 6) {
//                       return "must be at least 6 chars";
//                     } else {
//                       return null;
//                     }
//                   },
//                   onChanged: (value) {
//                     _cont.registrationModal.category = value;
//                   },
//                 ),
//                 MaterialButton(
//                   onPressed: () {
//                     _cont.postRegistration();
//                   },
//                   height: 50,
//                   minWidth: 100,
//                   color: Colors.teal,
//                   child: Text(
//                     "Submit",
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                  OutlinedButton(onPressed: (){
//                   Get.to(AppRoutes.registrationScreen);
//                  },
//                 // child: Text("Registered here",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
