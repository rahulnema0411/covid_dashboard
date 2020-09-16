import 'package:covid_dashboard/src/bloc/bloc_layer.dart';
import 'package:covid_dashboard/src/resources/repository.dart';
import 'package:covid_dashboard/src/ui/state_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (BuildContext context) {
            return BlocLayer(FetchDataEvent(), Repository());
          },
          child: StateList(),
        ),
      ),
    );
  }
}
