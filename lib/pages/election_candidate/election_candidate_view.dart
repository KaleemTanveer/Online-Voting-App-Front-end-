import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:voting_app/app_routes.dart';
import '../../models/election_candidate_modal.dart';
import 'election_candidate_controller.dart';
import 'package:http/http.dart' as http;

class ElectionCandidateView extends StatelessWidget {
  final ElectionCanadidateController _cont =
      Get.put(ElectionCanadidateController());
  final LocalAuthentication auth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(_cont.election_title),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: _cont.allElectionCandidate.length,
                itemBuilder: (contest, index) {
                  ElectionCandidateModel tempCandidate =
                      _cont.allElectionCandidate[index];

                  return GestureDetector(
                    onTap: () async {
                      await Get.defaultDialog(
                        content: Html(
                            data:
                                "Are you sure want to vote for<br><br><img src='http://192.168.254.112:8000/media/" +
                                    tempCandidate.logo +
                                    "' /><br><br><b>" +
                                    tempCandidate.full_name +
                                    "</b><br>(Party: " +
                                    tempCandidate.title +
                                    ") ?",
                            style: {"*": Style(textAlign: TextAlign.center)}),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: () => Get.back(),
                                  child: Text("no"),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.grey))),
                              ButtonTheme(
                                minWidth: 100,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors
                                            .blue, //background color of button/border width and color
                                        elevation: 3,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.width *
                                                0.15) //content padding inside button
                                        ),
                                    onPressed: () async {
                                      print(GetStorage().read('user_email'));
                                      List<String> mothers = [];
                                      dynamic response = await http.get(
                                        Uri.parse(
                                            'http://192.168.254.112:8000/mother-mcq-list'),
                                        headers: {
                                          "Accept": "application/json",
                                          "Content-Type":
                                              "application/x-www-form-urlencoded",
                                          "Cookie": GetStorage().read('cookies')
                                        },
                                      );
                                      if (response.statusCode == 200) {
                                        dynamic data =
                                            json.decode(response.body);
                                        print(mothers);
                                        for (var mother in data['mothers']) {
                                          mothers.add(mother);
                                        }
                                      }
                                      Get.close(1);
                                      Get.defaultDialog(
                                          title: "Validation",
                                          middleText:
                                              "What is your mother's name?",
                                          actions: mothers.map((mother) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                    onPressed: () async {
                                                      Get.close(1);
                                                      await Get.defaultDialog(
                                                          middleText:
                                                              "Are you sure " +
                                                                  mother +
                                                                  " is your mother's name?",
                                                          textCancel:
                                                              "Not sure",
                                                          textConfirm:
                                                              "I am sure.",
                                                          onCancel: () {},
                                                          onConfirm: () async {
                                                            Get.close(1);
                                                            bool authenticated =
                                                                await auth
                                                                    .authenticate(
                                                              localizedReason:
                                                                  'Let OS determine authentication method',
                                                              options:
                                                                  const AuthenticationOptions(
                                                                stickyAuth:
                                                                    true,
                                                              ),
                                                            );
                                                            if (!authenticated) {
                                                              await Get.defaultDialog(
                                                                  middleText:
                                                                      "Unabel to authenticate. Please try again.");
                                                              // Get.close(1);
                                                              return;
                                                            }
                                                            final response = await http.post(
                                                                Uri.parse(
                                                                    'http://192.168.254.112:8000/cast-vote'),
                                                                headers: {
                                                                  "Accept":
                                                                      "application/json",
                                                                  "Content-Type":
                                                                      "application/x-www-form-urlencoded",
                                                                  "Cookie":
                                                                      GetStorage()
                                                                          .read(
                                                                              'cookies')
                                                                },
                                                                body: {
                                                                  'mother_name':
                                                                      mother,
                                                                  'election_id': _cont
                                                                      .election_id
                                                                      .toString(),
                                                                  'candidate_id':
                                                                      tempCandidate
                                                                          .id
                                                                          .toString()
                                                                },
                                                                encoding: Encoding
                                                                    .getByName(
                                                                        "utf-8"));
                                                            if (response
                                                                    .statusCode ==
                                                                401) {
                                                              await Get.defaultDialog(
                                                                  middleText:
                                                                      "You already casted your vote");

                                                              Get.back();
                                                            } else if (response
                                                                    .statusCode !=
                                                                200) {
                                                              await Get.defaultDialog(
                                                                  middleText:
                                                                      "Please try again.");

                                                              Get.back();
                                                            } else {
                                                              await Get.defaultDialog(
                                                                  title:
                                                                      "Success",
                                                                  middleText:
                                                                      "Your vote has been casted");
                                                              Get.offAllNamed(
                                                                  AppRoutes
                                                                      .homeScreen);
                                                              // Get.close(1);
                                                            }
                                                          });
                                                    },
                                                    child: Text(mother)),
                                              ],
                                            );
                                          }).toList());
                                    },
                                    child: Text("Yes")),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              offset: Offset(5, 5)),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Image.network(
                              'http://192.168.254.112:8000/media/' +
                                  tempCandidate.logo,
                              fit: BoxFit.cover,
                              width: 200,
                              height: 200,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                color: Colors.black.withOpacity(0.4),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      tempCandidate.full_name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Party: " + tempCandidate.title,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}






// child: Text(tempCandidate.title),


// alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                     color: Colors.amber,
//                     borderRadius: BorderRadius.circular(15)),