import 'package:flutter/material.dart';

import 'world_states.dart';

class CountryDetailsScreen extends StatefulWidget {
  String image;
  String name;
  int totalCases;
  int totalDeaths;
  int totalRecoverd;
  int active;
  int critical;
  int todayRecovered;
  int test;

  CountryDetailsScreen({
    Key? key,
    required this.image,
    required this.name,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecoverd,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  }) : super(key: key);

  @override
  State<CountryDetailsScreen> createState() => _CountryDetailsScreenState();
}

class _CountryDetailsScreenState extends State<CountryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.09),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.067),
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.06),
                          ReuseableRow(
                              title: "Cases",
                              value: widget.totalCases.toString()),
                          ReuseableRow(
                              title: "Recoverd",
                              value: widget.totalRecoverd.toString()),
                          ReuseableRow(
                              title: "Active", value: widget.active.toString()),
                          ReuseableRow(
                              title: "Deaths",
                              value: widget.totalDeaths.toString()),
                          ReuseableRow(
                              title: "Tests", value: widget.test.toString()),
                          ReuseableRow(
                              title: "Critical",
                              value: widget.critical.toString()),
                          ReuseableRow(
                              title: "TodayRecoverd",
                              value: widget.todayRecovered.toString()),
                        ],
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(widget.image),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
