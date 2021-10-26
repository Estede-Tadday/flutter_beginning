import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:redditech/api/login.dart';
import 'package:redditech/api/reddit_info.dart';
import 'package:redditech/models/album.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redditech',
<<<<<<< HEAD
      theme: ThemeData(primaryColor: Colors.white),
=======
      theme: ThemeData(
        appBarTheme: AppBarTheme(
        color: const Color(0xFFFFB74D),
    )),
>>>>>>> [+] problem setting
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          padding: const EdgeInsets.all(50),
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "LOGIN",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 50.0,
                    color: Colors.black54),
              ),
              const SizedBox(
                height: 60,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Client_id',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.account_circle),
                ),
                onChanged: (clientId) {},
                onSaved: (clientId) {},
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Client_secret',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                onChanged: (clientSecret) {},
                onSaved: (clientSecret) {},
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 15)),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginWebView()),
                  );
                },
                child: const Text("Connection"),
              ),
              const SizedBox(
                height: 70,
              ),
              Image.asset(
                'images/reddit.png',
                height: 150,
                width: 150,
              )
            ],
          )),
      appBar: AppBar(
<<<<<<< HEAD
        title: Center(
            child: Text(
          "Redditech",
          style: TextStyle(color: Colors.black54),
        )),
=======
        title: Column(
          children: [
            Center(
                child: Text(
              "Redditech",
              style: TextStyle(color: Colors.white),
            )),
          ],
        ),
>>>>>>> [+] problem setting
      ),
    );
  }
}

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  var user = Album("Estede-Tadday Makusa", "estedemks@gmail.com",
      "La meilleure description Tinder homme doit mettre en évidence quelques traits attrayants d’une manière qui semble désinvolte et naturelle. Elle ne vous connaît pas, donc elle vous juge uniquement sur vos photos et votre biographie – et cette première impression se forme en quelques microsecondes.");
  var follow = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: Colors.orange[200],
=======
      backgroundColor: Colors.white,
>>>>>>> [+] problem setting
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                "images/reddit.png",
                height: 150.0,
                width: 100.0,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Follower : $follow",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            const SizedBox(height: 24),
            Text(
              user.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              user.email,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 30),
            Text(
              user.about,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}

class Saved extends StatelessWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved"),
      ),
      body: Container(),
    );
  }
}