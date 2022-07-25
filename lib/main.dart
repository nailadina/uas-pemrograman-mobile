// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:uas1/view/otomotifNews.dart';
import 'package:uas1/view/sportNews.dart';
import 'package:uas1/view/teknoNews.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Naila News',
        theme: ThemeData(appBarTheme: AppBarTheme(elevation: 0)),
        debugShowCheckedModeBanner: false,
        home: Home()


    );
  }
}
class  Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  //create controller untuk tabBar
  late TabController controller;

  @override

  void initState(){
    controller = TabController(vsync: this, length: 3);
    //tambahkan SingleTickerProviderStateMikin pada class _HomeState
    super.initState();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //create appBar
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Naila News"),
        //bottom
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(text: 'Otomotif',),
            Tab(text: 'Sport',),
            Tab(text: 'Tekno',),
            //new Tab(text: 'News')
          ],
        ),
      ),

      body: TabBarView(
        controller: controller,
        children: <Widget>[
          OtomotifNews(), 
          SportNews(),
          TeknoNews()
        ],
      ),
    );
  }
}
// class  Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

