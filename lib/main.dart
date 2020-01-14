import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  // Future<void> getData() async {
  //   try {
  //     await Future.delayed(Duration(seconds: 4), () => print('Large Latte'));
  //     print('hello');
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  Future<void> getData() async {
    var url = 'https://api.github.com/repos/facebook/codemod/commits';

  // Await the http  as get response, then decode the json-formatted response.
  var response = await http.get(
    url,
     headers: {'Accept': 'application/vnd.github.v3+json'}
  
  );
  if (response.statusCode == 200) {
    print(response.body);
    var jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}
