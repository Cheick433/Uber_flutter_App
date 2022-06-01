import 'package:flutter/material.dart';
//import 'package:myfluterap/rating_screen/rating_bar_widget.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({Key? key}) : super(key: key);

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Star Rating Bar in Flutter')),
        body: Center(
          child: Text("home"),
        ),
      ),
    );
  }
}
