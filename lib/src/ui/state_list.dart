import 'package:covid_dashboard/src/bloc/bloc_layer.dart';
import 'package:covid_dashboard/src/constants.dart';
import 'package:covid_dashboard/src/models/card_data.dart';
import 'package:covid_dashboard/src/ui/data_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StateList extends StatelessWidget {
  final CardData _cardData = CardData();

  @override
  Widget build(BuildContext context) {
    final blocLayer = BlocProvider.of<BlocLayer>(context);

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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            DataCard(
              cardData: _cardData,
              onPressed: () {},
            ),
            BlocBuilder<BlocLayer, DataEvent>(
              builder: (context, state) {
                if (state is DataIsLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is DataIsNotLoadedState) {
                  return Text('Could not load Data');
                } else if (state is DataIsLoadedState) {
                  return Text('Data is Loaded');
                }
                return Text('Hello');
              },
            ),
          ],
        ),
      ),
    );
  }
}
