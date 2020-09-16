import 'dart:async';
import 'package:covid_dashboard/src/models/list_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart' show Client;

class ApiProvider {
  Client client = Client();
  final _national_Level_apiKey = 'https://api.covid19india.org/data.json';

  Future<ListCard> fetchData() async {
    print("entered");
    final response = await client.get(_national_Level_apiKey);
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ListCard.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
/*
//The Network Provider Class
class ApiProvider {
  //This api fetches district level data as per states
  //final _state_district_wise_apiKey =
  //  'https://api.covid19india.org/state_district_wise.json';

  //This api fetches state level data and cases time series
  final _national_Level_apiKey = 'https://api.covid19india.org/data.json';

  var _stateLevelResponse;
  //var _districtLevelResponse;

  //Getter Methods to get the api response

  Future<void> getResponse() async {
    http.Response _responseStateLevel = await http.get(_national_Level_apiKey);

    //http.Response _responseDistrictLevel =
    //  await http.get(_state_district_wise_apiKey);

    if (_responseStateLevel.statusCode == 200) {
      _stateLevelResponse = jsonDecode(_responseStateLevel.body);
      //_districtLevelResponse = jsonDecode(_responseDistrictLevel.body);
    }
  }

  get stateLevelResponse => _stateLevelResponse;
  //get districtLevelResponse => _districtLevelResponse;
}
*/
