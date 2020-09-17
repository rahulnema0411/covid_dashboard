import 'package:covid_dashboard/src/bloc/bloc_layer.dart';
import 'package:covid_dashboard/src/constants.dart';
import 'package:covid_dashboard/src/models/card_data.dart';
import 'package:covid_dashboard/src/models/list_card.dart';
import 'package:covid_dashboard/src/ui/list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bar_chart.dart';
import 'stack_area.dart';
import 'time_series.dart';
import 'package:http/http.dart' as http;
import 'package:covid_dashboard/src/constants.dart';

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
              return dataStats(
                () {
                  setState(() {
                    _selectedWidget = 0;
                  });
                },
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

  Widget dataStats(Function function) {
    return StreamBuilder(
        stream: bloc.response,
        builder: (context, AsyncSnapshot<http.Response> snapshot) {
          if (snapshot.hasData) {
            http.Response response = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                        color: kCardColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                        boxShadow: [
                          new BoxShadow(
                            color: kShadowColor,
                            blurRadius: 18.0,
                          ),
                        ]),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Bar Chart',
                            style: cardsubHeading_textStyle,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: BarChart.withData(response),
                            height: 600.0,
                            width: 20000.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                        color: kCardColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                        boxShadow: [
                          new BoxShadow(
                            color: kShadowColor,
                            blurRadius: 18.0,
                          ),
                        ]),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Stack Area Chart',
                            style: cardsubHeading_textStyle,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: StackedAreaLineChart.withData(response),
                            height: 600.0,
                            width: 1000.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: function,
                    child: Text('GO Back'),
                  ),
                ],
              ),
            );
          } else {
            return Text('Hello');
          }
        });
  }
}
