import 'package:covid_dashboard/src/models/card_data.dart';
import 'package:covid_dashboard/src/ui/data_card.dart';
import 'package:flutter/material.dart';

class CardListView extends StatelessWidget {
  final List<CardData> _list;
  final Function _function;
  CardListView(this._list, this._function);

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
    cardList.add(
      DataCard(
        cardData: _list[0],
        onPressed: _function,
      ),
    );
    for (int i = 1; i < _list.length; i++) {
      cardList.add(
        DataCard(
          cardData: _list[i],
          onPressed: null,
        ),
      );
    }

    return cardList;
  }
}
