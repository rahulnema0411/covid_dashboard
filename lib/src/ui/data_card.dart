import 'package:covid_dashboard/src/models/card_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:covid_dashboard/src/constants.dart';

class DataCard extends StatelessWidget {
  final CardData cardData;
  final Function onPressed;

  DataCard({@required this.cardData, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
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
        child: FlatButton(
          padding: EdgeInsets.all(0.0),
          onPressed: onPressed,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.topLeft,
                child: Text(
                  cardData.location,
                  style: cardHeading_textStyle,
                ),
              ), //heading
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  'Active Cases : ${cardData.activeCases}',
                  style: cardsubHeading_textStyle,
                ),
              ), //subheading
              Container(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Total Confirmed  :  ',
                          style: cardData_textStyle,
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          'Total Recovered  :  ',
                          style: cardData_textStyle,
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          'Total Deaths        :  ',
                          style: cardData_textStyle,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          cardData.confirmed,
                          style: cardData_textStyle,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          cardData.recovered,
                          style: cardData_textStyle,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          cardData.deceased,
                          style: cardData_textStyle,
                        ),
                      ],
                    ), //recovered
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.arrow_drop_up,
                              color: kAccentColor_red,
                            ),
                            Text(
                              cardData.newConfirmed,
                              style: cardData_textStyle.copyWith(
                                fontSize: 10.0,
                                color: kAccentColor_red,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.arrow_drop_up,
                              color: kAccentColor_green,
                            ),
                            Text(
                              cardData.newRecovered,
                              style: cardData_textStyle.copyWith(
                                fontSize: 10.0,
                                color: kAccentColor_green,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.arrow_drop_down),
                            Text(
                              cardData.newDeaths,
                              style: cardData_textStyle.copyWith(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ), //deaths
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
