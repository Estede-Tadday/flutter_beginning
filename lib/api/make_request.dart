import 'package:redditech/api/login.dart';
import 'package:http/http.dart' as http;
import 'package:redditech/api/reddit_info.dart';
import 'dart:convert';

Future<String> makeGetRequest(String url) async {
  final response = await http.get(
      Uri.parse(url),
      headers: <String, String> {
        'Content-Type': 'application/x-www-form-urlencoded',
        'authorization': 'Bearer ${red.getToken()}',
      }
  );
  if (response.statusCode != 200)
      return "null";
  return response.body;
}