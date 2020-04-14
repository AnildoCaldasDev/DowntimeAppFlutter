import 'package:downtime_app_flutter/pages/dashboards.dart';
import 'package:downtime_app_flutter/pages/downtime.dart';
import 'package:downtime_app_flutter/pages/home.dart';
import 'package:downtime_app_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'commons/collapsing_navigation_drawer.dart';
import 'commons/navigation_drawer_bloc.dart';

//Fonte de base do drwaer com gesture: https://github.com/ashishrawat2911/flutter_navigation_drawer_bloc/blob/master/lib/src/ui/my_home_page.dart
//Fonte do navigationBloc: http://flutterdevs.com/blog/managing-the-state-of-a-widget-using-bloc-flutter/


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
      // deste jeito consigo fazer o gestos para abrir e fechar
      drawer: CollapsingNavigationDrawer(bloc: bloc),
      body: StreamBuilder(
        stream: bloc.getNavigation,
        initialData: bloc.navigationProvider.currentNavigation,
        builder: (context, snapshot) {
          switch (bloc.navigationProvider.currentNavigation) {
            case "home":
              return Home();
              break;

            case "dashboards":
              return Dashboards();
              break;

            case "downtimes":
              return Downtime();
              break;

            default:
              return Home();
          }
        },
      ),

      //usando body o menu lateral vai ficar fixo de lado.
      // body: Stack(
      //   children: <Widget>[
      //     Container(color: Colors.white,),
      //     CollapsingNavigationDrawer(bloc: bloc)
      //   ],
      // ),
    );
  }
}
