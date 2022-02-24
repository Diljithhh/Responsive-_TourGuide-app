import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_project/datamodel/datamodel.dart';

class DataServices {
  String base_url = "http://mark.bslmeiyu.com/api";

  Future<List<DataModel>> getdata() async {
    var apiurl = '/getplaces';
    http.Response res = await http.get(Uri.parse(base_url + apiurl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);

        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);

      return <DataModel>[];
    }
  }
}
