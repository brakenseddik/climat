import 'dart:convert';

import 'package:http/http.dart' as http;

class networkHelper {
  networkHelper({this.uri});

  final String uri;

  Future getData() async {
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodData = jsonDecode(data);
    } else
      print(response.statusCode);
  }
}
