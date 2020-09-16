import 'package:covid_dashboard/src/bloc/bloc_layer.dart';
import 'package:covid_dashboard/src/constants.dart';
import 'package:covid_dashboard/src/models/card_data.dart';
import 'package:covid_dashboard/src/models/list_card.dart';
import 'package:covid_dashboard/src/ui/data_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StateList extends StatelessWidget {
  final CardData _cardData = CardData();

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllData();

    return Scaffold(
      backgroundColor: kAppBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kAppBarColor,
        elevation: 0.0,
        title: Text(
          'COVID Dashboard',
          style: TextStyle(
            color: kTextColor,
            fontWeight: FontWeight.w900,
            fontSize: 28.0,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: bloc.data,
        builder: (context, AsyncSnapshot<ListCard> snapshot) {
          if (snapshot.hasData) {
            return Text('Data Loaded');
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
