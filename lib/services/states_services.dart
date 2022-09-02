import 'dart:convert';

import 'package:covid_tracker/model/world_states_model.dart';
import 'package:covid_tracker/services/utils/app_url.dart';
import 'package:http/http.dart' as http;

class StatesSevices {
  Future<WorldStatesModel> fetchWorldStatesRecord() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return WorldStatesModel.fromJson(data);
    } else {
      return throw Exception('Error');
    }
  }

  Future<List<dynamic>> countriesListApi() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    } else {
      return throw Exception('Error');
    }
  }
}
