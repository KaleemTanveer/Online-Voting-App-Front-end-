import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:voting_app/common_func.dart';
import 'package:voting_app/models/election_candidate_modal.dart';
import 'package:voting_app/models/election_modal.dart';
import 'package:voting_app/pages/election_result/election_result_controller.dart';
import 'package:voting_app/pages/election_candidate/election_candidate_view.dart';

class ElectionResultView extends StatelessWidget {
  ElectionResultController _cont = Get.put(ElectionResultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Election Result"),
      ),
      body: Obx(
        () => Stack(children: [
          ListView.builder(
              itemCount: _cont.allElectionCandidate.length,
              itemBuilder: ((context, index) {
                return electionResultItem(_cont.allElectionCandidate[index]);
              }))
        ]),
      ),
    );
  }

  Widget electionResultItem(ElectionCandidateModel electionCandidate) {
    return Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.5, color: Colors.grey.shade500))),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 80,
                  child: Stack(
                    children: [
                      Image.network(
                        'http://192.168.254.112:8000/media/' +
                            electionCandidate.logo,
                        fit: BoxFit.cover,
                        height: 80,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                electionCandidate.full_name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Party: " + electionCandidate.title,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ).marginOnly(right: 10),
                Text(
                  "Total Votes: " +
                    // electionCandidate.total_votes.toString() +
                    (electionCandidate.accepted_votes + electionCandidate.rejected_votes).toString()+

                    "\nAccepted Votes: " +
                    electionCandidate.accepted_votes.toString() +
                    "\nRejected Votes: " +
                    electionCandidate.rejected_votes.toString())
              ],
            ),
            if (_cont.allElectionCandidate.indexOf(electionCandidate) == 0)
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: Stack(
                    children: [
                      Icon(
                        FontAwesomeIcons.certificate,
                        size: 70,
                        color: Colors.black54,
                      ),
                      Icon(
                        FontAwesomeIcons.certificate,
                        size: 66,
                        color: Colors.green,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "The\nWinner",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      // Center(
                      //   child: Icon(FontAwesomeIcons.check),
                      // )
                    ],
                  ),
                ),
              ),
          ],
        )

        // ListTile(
        //   enabled: false,
        //   tileColor: Colors.white,
        //   title: Text(
        //     electionCandidate.title,
        //     style: TextStyle(fontSize: 18, color: Colors.black),
        //   ),
        //   isThreeLine: true,
        //   subtitle: Text("Total Votes: \nAccepted Votes: \nRejected Votes: \n"),
        //   leading:
        // ),
        );
  }
}
