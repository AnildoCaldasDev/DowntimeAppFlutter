import 'package:downtime_app_flutter/theme.dart';
import 'package:flutter/material.dart';

import 'commons/collapsing_navigation_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foxgram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: Text("FMS - Foxconn Manager System",
            style: TextStyle(fontSize: 18, color: textTitleFuturistic)),
        centerTitle: true,
        //backgroundColor: drawerBackgroundColor,
        backgroundColor: backGroundColorFuturistic,
      ),
      ///drawer: CollapsingNavigationDrawer(),// deste jeito consigo fazer o gestos para abrir e fechar
      //usando body o menu lateral vai ficar fixo de lado.
      body: Stack(
        children: <Widget>[
          Container(color: Colors.white),            
          CollapsingNavigationDrawer()
        ],
      ),
    );
  }
}
