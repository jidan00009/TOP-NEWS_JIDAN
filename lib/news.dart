import 'dart:convert';

import 'package:aplikasi_jidan_top_news/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detail.dart';

class news extends StatefulWidget {
  final String countryCode;

  const news({Key? key, required this.countryCode}) : super(key: key);

  @override
  State<news> createState() => _newsState();
}

class _newsState extends State<news> {
  List _posts = [];
  String _selectedCategory = 'general';

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TOP NEWS'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'news category',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home), // Icon kembali (home)
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.trending_up),
              title: const Text('Latest News'),
              onTap: () {
                _selectCategory('general');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text('Business'),
              onTap: () {
                _selectCategory('business');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.computer),
              title: const Text('Technology'),
              onTap: () {
                _selectCategory('technology');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.health_and_safety),
              title: const Text('Health'),
              onTap: () {
                _selectCategory('health');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_roll),
              title: const Text('Entertainment'),
              onTap: () {
                _selectCategory('entertainment');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.science),
              title: const Text('Science'),
              onTap: () {
                _selectCategory('science');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.sports_kabaddi),
              title: const Text('Sports'),
              onTap: () {
                _selectCategory('sports');
                Navigator.pop(context);
              },
            ),
            // Tambahkan kategori lainnya sesuai kebutuhan
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              color: Colors.grey,
              height: 100,
              width: 100,
              child: _posts[index]['urlToImage'] != null
                  ? Image.network(_posts[index]['urlToImage'])
                  : const Icon(Icons.image_not_supported),
            ),
            title: Text("${_posts[index]['title'] ?? 'No Title'}"),
            subtitle:
                Text("${_posts[index]['description'] ?? 'No Description'}"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => Detail(
                    url: _posts[index]['url'],
                    title: _posts[index]['title'],
                    content: _posts[index]['content'],
                    publishedAt: _posts[index]['publishedAt'],
                    author: _posts[index]['author'],
                    urlToImage: _posts[index]['urlToImage'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
    _getData();
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=${widget.countryCode}&category=$_selectedCategory&apiKey=16a688bff67840238c23ff9a8c501655'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _posts = data["articles"];
        });
        print(_posts);
      }
    } catch (e) {
      print(e);
    }
  }
}
