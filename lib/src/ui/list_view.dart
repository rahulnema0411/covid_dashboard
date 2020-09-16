import 'package:covid_dashboard/src/models/card_data.dart';
import 'package:covid_dashboard/src/ui/data_card.dart';
import 'package:flutter/material.dart';

class CardListView extends StatelessWidget {
  final List<CardData> _list;

  CardListView(this._list);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: getList(),
      ),
    );
  }

  List<DataCard> getList() {
    List<DataCard> cardList = [];

    for (int i = 0; i < _list.length; i++) {
      cardList.add(DataCard(cardData: _list[i], onPressed: null));
    }

    return cardList;
  }
}
