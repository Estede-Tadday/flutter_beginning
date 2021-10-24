import 'package:redditech/user.dart';

class RedditInfo {
  String bearerToken = '';
  UserInfo userInfo = UserInfo();

  void setBearerToken(String token) {
    bearerToken = token;
  }
  String getToken() {
    return bearerToken;
  }
}

RedditInfo red = RedditInfo();