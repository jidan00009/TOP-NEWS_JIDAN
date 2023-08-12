import 'package:flutter/material.dart';

import 'news.dart';

class Negara {
  final String kode;
  Negara(this.kode);
}

class DaftarNegara {
  static List<Negara> daftar = [
    Negara('us'),
    Negara('id'),
    Negara('ru'),
    Negara('in'),
    Negara('au'),
    Negara('my'),

    // Tambahkan negara lain jika diperlukan...
  ];
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedCountry = DaftarNegara.daftar[0].kode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("TOP NEWS"),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(25),
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                _updateCountryCode('id');
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Image(
                      image: AssetImage('assets/id.jpg'),
                      width: 70,
                      height: 70,
                    ),
                    Text("Indonesia", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                _updateCountryCode('au');
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Image(
                      image: AssetImage('assets/au.png'),
                      width: 70,
                      height: 70,
                    ),
                    Text("Autralia", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                _updateCountryCode('my');
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Image(
                      image: AssetImage('assets/my.jpeg'),
                      width: 70,
                      height: 70,
                    ),
                    Text("Malaysia", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                _updateCountryCode('ru');
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Image(
                      image: AssetImage('assets/ru.jpg'),
                      width: 70,
                      height: 70,
                    ),
                    Text("Rusia", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                _updateCountryCode('in');
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Image(
                      image: AssetImage('assets/in.jpg'),
                      width: 70,
                      height: 70,
                    ),
                    Text("India", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                _updateCountryCode('us');
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Image(
                      image: AssetImage('assets/us.png'),
                      width: 70,
                      height: 70,
                    ),
                    Text("Amerika Serikat ", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateCountryCode(String countryCode) {
    setState(() {
      _selectedCountry = countryCode;
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => news(countryCode: _selectedCountry)));
  }
}
