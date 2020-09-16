import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
