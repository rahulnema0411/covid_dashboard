import 'package:covid_dashboard/src/bloc/bloc_layer.dart';
import 'package:covid_dashboard/src/resources/repository.dart';
import 'package:covid_dashboard/src/ui/state_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StateList(),
      ),
    );
  }
}
