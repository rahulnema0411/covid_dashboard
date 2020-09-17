import 'dart:async';
import 'package:covid_dashboard/src/models/list_card.dart';
import 'package:http/http.dart' show Client;

class ApiProvider {
  Client client = Client();
  final nationalLevelApiKey = 'https://api.covid19india.org/data.json';
  final stateLevelApiKey =
      'https://api.covid19india.org/state_district_wise.json';

  Future<ListCard> fetchData() async {
    print("entered");
    final responseNational = await client.get(nationalLevelApiKey);
    //final responseState = await client.get(stateLevelApiKey);
    //print(responseState.body.toString());
    if (responseNational.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ListCard.fromJson(responseNational);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
