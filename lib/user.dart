import 'package:redditech/api/make_request.dart';
import 'dart:convert';

class UserInfo {
  String name = 'default';
  String desc = 'default';
  String pictureUrl = 'default';

  Future<void> setData() async {
    var content = await makeGetRequest('https://oauth.reddit.com/api/v1/me');
    Map<String, dynamic> json = jsonDecode(content);
    print(content);
    print("Desc is empty ?");
    pictureUrl = json["icon_img"];
    name = json["name"];
    if (json["description"]?.isEmpty() ?? false) {
      desc = json["description"];
    }
  }
}