import 'package:flutter/material.dart';
import 'package:flutter_web_diary/diary_card.dart';
import 'package:flutter_web_diary/top_bar_title.dart';

import 'diary_entry_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Diary',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.pink,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/new-entry': (context) => DiaryEntryPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(94.0),
          child: TopBarTitle('Diary Entries'),
        ),
        elevation: 0,
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 3 / 5,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 90),
              DiaryCard(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        elevation: 1.5,
        onPressed: () => Navigator.of(context).pushNamed('/new-entry'),
        tooltip: 'Add To Do',
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}

var diaryEntry =
    'People just dont understand how I am built and reason. There is so much that I want to explain. However, I cannot do that as I have the disability of talking cock. Someday they will understand that talking cock is great';