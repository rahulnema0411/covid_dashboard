import 'package:covid_dashboard/src/ui/state_list.dart';
import 'package:flutter/material.dart';

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
