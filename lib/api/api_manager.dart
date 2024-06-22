import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pr1/api/api%20constants.dart';

class ApiManger {
  static Future<void> getsource() async {
    Uri url = Uri.https(
      ApiConstans.baseUrl, ApiConstans.sourceApi,

      //Map
    );
    var response = await http.get(url);
    var responseBody=response .body;
    var json =jsonDecode( responseBody);
   //بيبقي موجد داخل الموديل الي خته من الباك return sourceResponse.fromjson(json);

  }
}
