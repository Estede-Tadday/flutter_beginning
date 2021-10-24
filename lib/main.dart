import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:api/login.dart';
import 'package:api/reddit_info.dart';
import 'package:settings_ui/settings_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redditech',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      debugShowCheckedModeBanner: false,
      home: const _Homepage(),
    );
  }
}

class _Homepage extends StatefulWidget {
  const _Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class SecondWindow extends StatefulWidget {
  const SecondWindow({Key? key}) : super(key: key);

  @override
  State<SecondWindow> createState() => _SecondWindowState();
}

class _SecondWindowState extends State<SecondWindow> {
  int _selectedIndex = 0;
  var isSwitched = false;

  static final List<Widget> _widgetOptions = <Widget>[
    ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 130,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 130,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry B')),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 130,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry C')),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 130,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry C')),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 130,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    ),
    Text(
      'Add',
    ),
    Text(
      'Sub',
    ),
  ];

  void _indexTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Search');
  var search;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => _SearchBar()),
            );
          },
          icon: Icon(Icons.search),
        )
      ]),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.cyan),
            child: Image.network(
              red.userInfo.pictureUrl.substring(0, red.userInfo.pictureUrl.indexOf('?'))
            ),
          ),
           Center(
              child: Text(
            red.userInfo.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.deepOrangeAccent),
          )),
          ListTile(
            subtitle: ElevatedButton.icon(
              icon: Icon(Icons.account_circle),
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => _Profile()),
                );
              },
              label: Text("Profile"),
            ),
          ),
          ListTile(
            subtitle: ElevatedButton.icon(
              icon: Icon(Icons.add_to_photos),
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => _Saved()),
                );
              },
              label: Text("Saved"),
            ),
          ),
          ListTile(
            subtitle: ElevatedButton.icon(
              icon: Icon(Icons.assignment_ind_sharp),
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15)),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => _Homepage()),
                );
              },
              label: Text("Login"),
            ),
          ),
          ListTile(
            subtitle: ElevatedButton.icon(
              icon: Icon(Icons.arrow_circle_down_rounded),
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15)),
              onPressed: () => SystemNavigator.pop(),
              label: Text("Quit"),
            ),
          ),
        ]),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.cyan,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add",
            backgroundColor: Colors.cyan,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: "Sub",
            backgroundColor: Colors.cyan,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.cyan,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _indexTapped,
      ),
    );
  }
}

class _HomepageState extends State<_Homepage> {
  var clientId;
  var clientSecret;

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
        title: Center(
            child: Text(
          "Redditech",
          style: TextStyle(color: Colors.black54),
        )),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: const TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search...',
              border: InputBorder.none),
        ),
      )),
    );
  }
}

class _Profile extends StatelessWidget {
  const _Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(),
    );
  }
}

class _Saved extends StatelessWidget {
  const _Saved({Key? key}) : super(key: key);

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
