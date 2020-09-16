import 'dart:async';
import 'package:covid_dashboard/src/constants.dart';
import 'package:covid_dashboard/src/models/card_data.dart';
import 'package:covid_dashboard/src/resources/api_provider.dart';

class Repository {
  Future<List> getData() async {
    ApiProvider apiProvider = ApiProvider();
    await apiProvider.getResponse();

    var _stateLevelData = apiProvider.stateLevelResponse;

    List<CardData> list;
    list = getCardDataList(_stateLevelData);
    print('Got the card list');

    return list;
  }

  List<CardData> getCardDataList(var decodedData) {
    List<CardData> list;

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

      list.add(cardData);
    }
    return list;
  }
}
