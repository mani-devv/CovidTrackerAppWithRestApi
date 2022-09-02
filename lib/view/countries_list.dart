import 'package:covid_tracker/services/states_services.dart';
import 'package:covid_tracker/view/country_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountreisListScreen extends StatefulWidget {
  const CountreisListScreen({Key? key}) : super(key: key);

  @override
  State<CountreisListScreen> createState() => _CountreisListScreenState();
}

class _CountreisListScreenState extends State<CountreisListScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatesSevices statesSevices = StatesSevices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                hintText: 'Search Country Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          Expanded(
              child: FutureBuilder(
            future: statesSevices.countriesListApi(),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (!snapshot.hasData) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade700,
                  highlightColor: Colors.grey.shade100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            ListTile(
                                title: Container(
                                    color: Colors.white, height: 10, width: 80),
                                subtitle: Container(
                                    color: Colors.white, height: 10, width: 80),
                                leading: Container(
                                    color: Colors.white,
                                    height: 50,
                                    width: 50)),
                          ],
                        );
                      },
                    ),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListView.builder(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      String name = snapshot.data![index]['country'];

                      if (searchController.text.isEmpty) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => CountryDetailsScreen(
                                      image: snapshot.data![index]
                                          ['countryInfo']['flag'],
                                      name: snapshot.data![index]['country'],
                                      totalCases: snapshot.data![index]
                                          ['cases'],
                                      totalDeaths: snapshot.data![index]
                                          ['deaths'],
                                      totalRecoverd: snapshot.data![index]
                                          ['recovered'],
                                      active: snapshot.data![index]['active'],
                                      critical: snapshot.data![index]
                                          ['critical'],
                                      todayRecovered: snapshot.data![index]
                                          ['todayRecovered'],
                                      test: snapshot.data![index]['tests'],
                                    ),
                                  ),
                                );
                              },
                              child: ListTile(
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(
                                    snapshot.data![index]['cases'].toString()),
                                leading: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage(
                                    snapshot.data![index]['countryInfo']
                                        ['flag'],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else if (name
                          .toLowerCase()
                          .contains(searchController.text.toLowerCase())) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => CountryDetailsScreen(
                                      image: snapshot.data![index]
                                          ['countryInfo']['flag'],
                                      name: snapshot.data![index]['country'],
                                      totalCases: snapshot.data![index]
                                          ['cases'],
                                      totalDeaths: snapshot.data![index]
                                          ['deaths'],
                                      totalRecoverd: snapshot.data![index]
                                          ['recovered'],
                                      active: snapshot.data![index]['active'],
                                      critical: snapshot.data![index]
                                          ['critical'],
                                      todayRecovered: snapshot.data![index]
                                          ['todayRecovered'],
                                      test: snapshot.data![index]['tests'],
                                    ),
                                  ),
                                );
                              },
                              child: ListTile(
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(
                                    snapshot.data![index]['cases'].toString()),
                                leading: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage(
                                    snapshot.data![index]['countryInfo']
                                        ['flag'],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                );
              }
            },
          ))
        ],
      )),
    );
  }
}
