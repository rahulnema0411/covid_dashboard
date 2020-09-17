import 'dart:async';
import 'package:covid_dashboard/src/models/list_card.dart';
import 'package:covid_dashboard/src/resources/api_provider.dart';
import 'package:http/http.dart' as http;

class Repository {
  final apiProvider = ApiProvider();
  Future<ListCard> fetchAllData() => apiProvider.fetchData();
  http.Response getData() => apiProvider.data;
}
