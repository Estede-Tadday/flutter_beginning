import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:redditech/api/reddit_info.dart';
import 'search.dart';
import 'package:redditech/main.dart';

/*
Widget build(BuildContext context) {
  var _setting = false;

  return SwitchListTile(
    title: const Text('Lights'),
    value: _setting,
    onChanged: (bool value) {
      setState(() {
        _setting = value;
      });
    },
    secondary: const Icon(Icons.lightbulb_outline),
  );
}
*/

class _CustomListView extends StatefulWidget {
  const _CustomListView({Key? key}) : super(key: key);

  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<_CustomListView> {
  @override
  Widget build(BuildContext context) {
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
      const Text(
        'Add',
      ),
      const Text(
        'Sub',
      ),
      SwitchListTile(
        title: const Text('Lights'),
        value: _setting,
        onChanged: (bool value) {
          setState(() {
            _setting = value;
          });
        },
      )
    ];
  }
}


class SecondWindow extends StatefulWidget {
  const SecondWindow({Key? key}) : super(key: key);

  @override
  State<SecondWindow> createState() => _SecondWindowState();
}

class _SecondWindowState extends State<SecondWindow> {
  int _selectedIndex = 0;
  var setting = false;

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
    const Text(
      'Add',
    ),
    const Text(
      'Sub',
    ),
    SwitchListTile(
      title: const Text('Lights'),
      value: setting,
      onChanged: (bool value) {
        setState(() {
          setting = value;
        });
      },
    )
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
            items: const [
              DropdownMenuItem(
                child: Text(
                  "Best",
                  style: TextStyle(color: Colors.white),
                ),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text(
                  "Hot",
                  style: TextStyle(color: Colors.white),
                ),
                value: 2,
              ),
              DropdownMenuItem(
                child: Text(
                  "Top",
                  style: TextStyle(color: Colors.white),
                ),
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
                decoration: const BoxDecoration(color: Color(0xFFFFB74D)),
            child: Image.network(red.userInfo.pictureUrl
                .substring(0, red.userInfo.pictureUrl.indexOf(''))),
          ),
              Center(
                  child: Text(
                    red.userInfo.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFFFFB74D)),
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
            backgroundColor: Color(0xFFFFB74D),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add",
            backgroundColor: Color(0xFFFFB74D),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: "Sub",
            backgroundColor: Color(0xFFFFB74D),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Color(0xFFFFB74D),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _indexTapped,
      ),

    );
  }
}