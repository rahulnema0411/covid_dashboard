import 'dart:async';
import 'package:covid_dashboard/src/models/list_card.dart';
import 'package:covid_dashboard/src/resources/api_provider.dart';

class Repository {
  final apiProvider = ApiProvider();
  Future<ListCard> fetchAllData() => apiProvider.fetchData();
}
