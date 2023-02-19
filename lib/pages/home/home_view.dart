import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:voting_app/app_routes.dart';
import 'package:voting_app/pages/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController _cont = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Voting App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 18),
        child: Center(
            child: Form(
          child: ListView(
            children: [
              MaterialButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.electionListScreen);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                color: Colors.grey,
                child: Text(
                  "Election List",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                height: 50,
                minWidth: 100,
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  _cont.logout();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                color: Colors.grey,
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                height: 50,
                minWidth: 100,
              ),
              SizedBox(
                height: 30,
              ),
              // MaterialButton(
              //   onPressed: () {
              //     Get.to(RegistrationView());
              //   },
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(20.0))),
              //   color: Colors.grey,
              //   child: Text(
              //     "Registered Here",
              //     style: TextStyle(color: Colors.white, fontSize: 30),
              //   ),
              //   height: 50,
              //   minWidth: 100,
              // ),
            ],
          ),
        )),
      ),
    );
  }
}
