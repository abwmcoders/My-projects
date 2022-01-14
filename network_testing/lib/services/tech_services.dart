import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:network_testing/models/tech_news.dart';

const String jsonStr = "https://reqres.in/api/users?page=2";

Future<Datum> fetchTest() async {
  final response = await http
      .get(Uri.parse(jsonStr));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return Datum.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load testing');
  }
}