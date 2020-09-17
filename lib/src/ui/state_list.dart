import 'package:covid_dashboard/src/bloc/bloc_layer.dart';
import 'package:covid_dashboard/src/constants.dart';
import 'package:covid_dashboard/src/models/card_data.dart';
import 'package:covid_dashboard/src/models/list_card.dart';
import 'package:covid_dashboard/src/ui/list_view.dart';
import 'package:flutter/material.dart';

class StateList extends StatefulWidget {
  @override
  _StateListState createState() => _StateListState();
}

class _StateListState extends State<StateList> {
  int _selectedWidget = 0;

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllData();
    List<CardData> _list = [];
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
            _list = snapshot.data.list;
            if (_selectedWidget == 0) {
              return CardListView(_list, () {
                setState(() {
                  _selectedWidget = 1;
                });
                print('I was pressed');
              });
            } else if (_selectedWidget == 1) {
              return FlatButton(
                onPressed: () {
                  setState(() {
                    _selectedWidget = 0;
                  });
                },
                child: Text('Go Back'),
              );
            }
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
