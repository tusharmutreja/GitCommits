import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:firstapp/Api.dart';
import 'package:firstapp/Models/Commits.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Commits List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Commits List'),
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
    var commitList = new List<Commits>();

    _getAllCommits() {
    Api.getCommits().then((response) {
      setState(() {
        Iterable list = convert.jsonDecode(response.body);
        commitList = list.map((model) => Commits.fromJson(model)).toList();
      });
    });
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    _getAllCommits();
  }

  dispose() {
    super.dispose();
  }

  @override
 Widget build(context) {
    return Center(
      child: ListView.builder(
          itemCount: commitList.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(commitList[index].commitMsg.message));
          },
        ));
  }
}
