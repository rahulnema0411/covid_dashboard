import 'dart:convert';

import 'package:covid_dashboard/src/constants.dart';
import 'package:http/http.dart' as http;
import 'card_data.dart';

class ListCard {
  List<CardData> _list = [];

  List<CardData> get list => _list;

  ListCard.fromJson(http.Response response) {
    List<CardData> list = [];
    var decodedData = jsonDecode(response.body);

    for (int i = 0; i < 38; i++) {
      CardData cardData = CardData();

      print('in setting data to card local');
      String location = decodedData['statewise'][i]['state'];

      //TODO : make the data readable

      String confirmed =
          Essentials.toReadableInt(decodedData['statewise'][i]['confirmed']);
      String recovered =
          Essentials.toReadableInt(decodedData['statewise'][i]['recovered']);
      String deceased =
          Essentials.toReadableInt(decodedData['statewise'][i]['deaths']);

      String newConfirmed = Essentials.toReadableInt(
          decodedData['statewise'][i]['deltaconfirmed']);
      String newRecovered = Essentials.toReadableInt(
          decodedData['statewise'][i]['deltarecovered']);
      String newDeceased =
          Essentials.toReadableInt(decodedData['statewise'][i]['deltadeaths']);

      String activeCases =
          Essentials.toReadableInt(decodedData['statewise'][i]['active']);

      cardData = CardData(
        confirmed: confirmed,
        recovered: recovered,
        deceased: deceased,
        newRecovered: newRecovered.toString(),
        newDeaths: newDeceased,
        newConfirmed: newConfirmed,
        location: location,
        activeCases: activeCases,
      );
      cardData.printAllData();
      list.add(cardData);
    }
    _list = list;
  }

  void printList() {
    for (int i = 0; i < _list.length; i++) {
      _list[i].printAllData();
    }
  }
}
