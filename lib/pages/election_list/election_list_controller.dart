import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:voting_app/models/election_modal.dart';

class ElectionListController extends GetxController {
  var count = 0;
  void increment() {
    count++;
    update();
  }

  RxList<ElectionModal> upcoming_elections = RxList();
  RxList<ElectionModal> current_elections = RxList();
  RxList<ElectionModal> past_elections = RxList();

  void electionsData() async {
    dynamic response = await http.get(
      Uri.tryParse('http://192.168.254.112:8000/electionlist')!,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        "Cookie": GetStorage().read('cookies')
      },
    );
    dynamic api_data = json.decode(response.body);
    dynamic data = api_data['data'];
    for (var election in data['upcoming_elections']) {
      upcoming_elections.add(ElectionModal(
          election['id'],
          election['election_title'],
          election['start_at'],
          election['end_at'],
          election['voted']));
    }
    print(data['current_elections']);
    for (var election in data['current_elections']) {
      print("election");
      print(election);
      current_elections.add(ElectionModal(
          election['id'],
          election['election_title'],
          election['start_at'],
          election['end_at'],
          election['voted']));
    }
    for (var election in data['past_elections']) {
      past_elections.add(ElectionModal(
          election['id'],
          election['election_title'],
          election['start_at'],
          election['end_at'],
          election['voted'],
          isPast: true));
    }
  }

  @override
  void onInit() async {
    print("on init is called");
    electionsData();
    super.onInit();
  }
}
