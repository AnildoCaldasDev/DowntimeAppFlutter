// import 'package:downtime_app_flutter/pages/anatomyflutterapp.dart';
// import 'package:downtime_app_flutter/pages/dashboards.dart';
// import 'package:downtime_app_flutter/pages/downtime.dart';
// import 'package:downtime_app_flutter/pages/home.dart';
// import 'package:downtime_app_flutter/pages/mask_delivery.dart';
// import 'package:downtime_app_flutter/pages/product.repository.page.dart';
// import 'package:downtime_app_flutter/pages/todo_list.dart';
// import 'package:downtime_app_flutter/theme.dart';
import 'package:flutter/material.dart';
// import 'commons/collapsing_navigation_drawer.dart';
// import 'commons/navigation_drawer_bloc.dart';

//Fonte de base do drwaer com gesture: https://github.com/ashishrawat2911/flutter_navigation_drawer_bloc/blob/master/lib/src/ui/my_home_page.dart
//Fonte do navigationBloc: http://flutterdevs.com/blog/managing-the-state-of-a-widget-using-bloc-flutter/

void main() => runApp(MyApp());

/////////////////////////// original
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Foxgram',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: Colors.blueGrey,
//       appBar: new AppBar(
//         elevation: 0.0,
//         title: Text("FMS - Foxconn Manager System",
//             style: TextStyle(fontSize: 18, color: textTitleFuturistic)),
//         centerTitle: true,
//         //backgroundColor: drawerBackgroundColor,
//         backgroundColor: backGroundColorFuturistic,
//       ),
//       // deste jeito consigo fazer o gestos para abrir e fechar
//       drawer: CollapsingNavigationDrawer(bloc: bloc),
//       body: StreamBuilder(
//         stream: bloc.getNavigation,
//         initialData: bloc.navigationProvider.currentNavigation,
//         builder: (context, snapshot) {
//           switch (bloc.navigationProvider.currentNavigation) {
//             case "home":
//               return Home();
//               break;

//             case "dashboards":
//               return Dashboards();
//               break;

//             case "downtimes":
//               return Downtime();
//               break;

//             case "todolist":
//               return TodoList();
//               break;

//             case "maskdelivery":
//               return MaskDelivery();
//               break;

//             case "repositorypattern":
//               return ProductRepositoryPage();
//               break;

//             case "anatomyflutter":
//               return AnatomyFlutterApp();
//               break;

//             default:
//               return Home();
//           }
//         },
//       ),

//       //usando body o menu lateral vai ficar fixo de lado.
//       // body: Stack(
//       //   children: <Widget>[
//       //     Container(color: Colors.white,),
//       //     CollapsingNavigationDrawer(bloc: bloc)
//       //   ],
//       // ),
//     );
//   }
// }
//////////////////////////// fim original

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foxgram',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/anildocaldasavatar.jpg"),
              ),
              Text(
                "Anildo Caldas",
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              )
            ],
          ),

          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     Container(
          //       width: 100,
          //       color: Colors.white,
          //     ),
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          //         Container(
          //           height: 100,
          //           width: 100,
          //           color: Colors.yellow,
          //         ),
          //         Container(
          //           height: 100,
          //           width: 100,
          //           color: Colors.green,
          //         ),
          //       ],
          //     ),
          //     Container(
          //       width: 100,
          //       color: Colors.red,
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
