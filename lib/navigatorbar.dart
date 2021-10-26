import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:redditech/api/reddit_info.dart';
import 'search.dart';
import 'package:redditech/main.dart';

class SecondWindow extends StatefulWidget {
  const SecondWindow({Key? key}) : super(key: key);

  @override
  State<SecondWindow> createState() => _SecondWindowState();
}

class _SecondWindowState extends State<SecondWindow> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 200,
          color: Colors.black,
          child: const Center(child: Text('Entry A')),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 200,
          color: Colors.black,
          child: const Center(child: Text('Entry B')),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 200,
          color: Colors.black,
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
    Text(
      'Setting',
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
  var _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Center(
          child: DropdownButton(
            icon: Icon(Icons.arrow_drop_down),
            value: _value,
            items: [
              DropdownMenuItem(
                child: Text("Best"),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text("Hot"),
                value: 2,
              ),
              DropdownMenuItem(
                child: Text("Top"),
                value: 3,
              ),
            ],
            onChanged: (int? value) {
              setState(() {
                _value = value!;
              });
            },
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchBar()),
            );
          },
          icon: Icon(Icons.search),
        )
      ]),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.lightBlue),
                child: Image.network(red.userInfo.pictureUrl
                    .substring(0, red.userInfo.pictureUrl.indexOf(''))),
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
                      MaterialPageRoute(builder: (context) => Profile()),
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
                      MaterialPageRoute(builder: (context) => Saved()),
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
                      MaterialPageRoute(builder: (context) => Homepage()),
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
            backgroundColor: Colors.lightBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add",
            backgroundColor: Colors.lightBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: "Sub",
            backgroundColor: Colors.lightBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.lightBlue,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _indexTapped,
      ),

    );
  }
}