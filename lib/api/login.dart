import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:redditech/api/make_request.dart';
import 'package:redditech/api/reddit_info.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:redditech/main.dart';

final clientID = 'tUJfmmKbTJxAank_3n4nSA';
final clientSecret = 'udkE45h_BIjvMBYltvydeGL1br9wJQ';
final callbackURL = 'https://img.pikbest.com/58pic/35/39/61/62K58PICb88i68HEwVnm5_PIC2018.gif!w340';
final url = Uri.https('www.reddit.com', '/api/v1/authorize.compact', {
  'client_id': clientID,
  'response_type': 'code',
  'state': 'code_authorize',
  'redirect_uri': callbackURL,
  'duration': 'temporary',
  'scope': 'identity'
});

Future<int> accessToken(String code) async {
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$clientID:$clientSecret'));

  final response = await http.post(
      Uri.parse('https://www.reddit.com/api/v1/access_token'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'authorization': basicAuth,
      },
      body: <String, String>{
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': callbackURL
      });
  if (response.statusCode == 200) {
    var json = jsonDecode(response.body);
    red.setBearerToken(json["access_token"]);
    print("Token " + red.getToken());
    red.userInfo.setData();
    return 1;
  } else {
    return 0;
  }
}

class LoginWebView extends StatelessWidget {
  const LoginWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Redditech')),
      ),
      body: Container(
        child: WebView(
          initialUrl: url.toString(),
          onPageFinished: (String url) {
            var uri = Uri.parse(url);
            if (uri.host == 'img.pikbest.com') {
              //ElevatedButton.icon(onPressed: () {
              //Navigator.pushReplacement(
              //context,
              //MaterialPageRoute(builder: (context) => SecondWindow()),
              //);
              //}, icon: Icon(Icons.arrow_drop_down_circle), label: Text("App"));
              var ret = accessToken(uri.queryParameters["code"].toString());
            }
          },
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SecondWindow()),
          );
        },
          child: const Icon(Icons.navigation),
    ),
    );
  }
}
