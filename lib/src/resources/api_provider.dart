import 'dart:async';
import 'dart:convert';
import 'package:covid_dashboard/src/models/list_card.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

class ApiProvider {
  Client client = Client();
  final nationalLevelApiKey = 'https://api.covid19india.org/data.json';
  final stateLevelApiKey =
      'https://api.covid19india.org/state_district_wise.json';

  http.Response get data => _data;
  http.Response _data;

  Future<ListCard> fetchData() async {
    print("entered");
    final responseNational = await client.get(nationalLevelApiKey);
    //final responseState = await client.get(stateLevelApiKey);
    //print(responseState.body.toString());
    if (responseNational.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      _data = responseNational;
      return ListCard.fromJson(responseNational);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }


}
