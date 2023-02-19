import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:voting_app/common_func.dart';
import 'package:voting_app/models/election_modal.dart';

import 'package:voting_app/pages/election_list/election_list_controller.dart';
import 'package:voting_app/pages/election_result/election_result_view.dart';

import '../election_candidate/election_candidate_view.dart';

class ElectionListView extends StatelessWidget {
  ElectionListController _cont = Get.put(ElectionListController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Election List"),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(
              text: ("Current"),
            ),
            Tab(
              text: ("Coming"),
            ),
            Tab(
              text: ("Past"),
            )
          ]),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() => ListView.builder(
                  itemCount: _cont.current_elections.length,
                  itemBuilder: ((context, index) {
                    return electionItem(_cont.current_elections[index]);
                  }))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() => ListView.builder(
                  itemCount: _cont.upcoming_elections.length,
                  itemBuilder: ((context, index) {
                    return electionItem(_cont.upcoming_elections[index]);
                  }))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() => ListView.builder(
                  itemCount: _cont.past_elections.length,
                  itemBuilder: ((context, index) {
                    return electionItem(_cont.past_elections[index]);
                  }))),
            ),
          ],
        ),
      ),
    );
  }

  Widget electionItem(ElectionModal election) {
    // return Text(election.election_title);
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 0.5, color: Colors.grey.shade500))),
      child: ListTile(
        enabled: !election.voted || election.isPast,
        onTap: () {
          if (!election.voted)
            Get.to(() => ElectionCandidateView(), arguments: {
              'election_id': election.id,
              'election_title': election.election_title,
            });
          if (election.isPast)
            Get.to(() => ElectionResultView(), arguments: {
              'election_id': election.id,
              'election_title': election.election_title,
            });
        },
        tileColor: Colors.white,
        title: Text(election.election_title),
        isThreeLine: true,
        trailing: SizedBox(
          height: 60,
          width: 60,
          child: !election.voted
              ? Container()
              : Stack(
                  children: [
                    Icon(
                      FontAwesomeIcons.certificate,
                      size: 60,
                      color: Colors.black54,
                    ),
                    Icon(
                      FontAwesomeIcons.certificate,
                      size: 56,
                      color: Colors.green,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Voted",
                        style: TextStyle(
                            fontSize: 10, color: Colors.green.shade900),
                      ),
                    ),
                    Center(
                      child: Icon(FontAwesomeIcons.check),
                    )
                  ],
                ),
        ),
        subtitle: Text("Start: " +
            CommonFunc.datetimeToHuman(DateTime.parse(election.start_at)) +
            "\nEnd: " +
            CommonFunc.datetimeToHuman(DateTime.parse(election.end_at))),
      ),
    );
  }
}
