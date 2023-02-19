import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/election_candidate_modal.dart';

class ElectionResultController extends GetxController {
  RxList<ElectionCandidateModel> allElectionCandidate = RxList();
  String election_title = "";
  int election_id = -1;

  Future electionCandidate() async {
    dynamic response = await http.get(Uri.parse(
        'http://192.168.254.112:8000/election-results/' +
            election_id.toString() +
            '/'));
    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      print(jsonData);
      for (var election_candidate in jsonData['data']) {
        ElectionCandidateModel tempCandidate = ElectionCandidateModel(
            election_candidate['candidate_id'],
            election_candidate['candidate_full_name'],
            election_candidate['candidate_title'],
            election_candidate['candidate_logo'],
            // total_votes:
            //     int.parse(election_candidate['total_votes'].toString()),
            accepted_votes:
                int.parse(election_candidate['accepted_votes'].toString()),
            rejected_votes:
                int.parse(election_candidate['rejected_votes'].toString()));
        allElectionCandidate.add(tempCandidate);
      }
    }
  }

  @override
  void onInit() async {
    election_id = Get.arguments!['election_id'];
    election_title = Get.arguments!['election_title'];
    electionCandidate();
    super.onInit();
  }
}
