import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/election_candidate_modal.dart';

class ElectionCanadidateController extends GetxController {
  RxList<ElectionCandidateModel> allElectionCandidate = RxList();
  String election_title = "";
  int election_id = -1;

  Future electionCandidate() async {
    dynamic response = await http.get(Uri.parse(
        'http://192.168.254.112:8000/electioncandidate/' +
            election_id.toString() +
            '/'));
    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      print(jsonData);
      for (var api in jsonData['election_candidates']) {
        ElectionCandidateModel tempCandidate = ElectionCandidateModel(
            api['id'], api['full_name'], api['title'], api['logo']);
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
