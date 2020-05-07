import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnatomyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("I Am Rich"),
        backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
      ),
      body: Center(
        child: Image(image: AssetImage('images/diamond.png')
            // image: NetworkImage(
            //     "https://i.pinimg.com/236x/ca/76/0b/ca760b70976b52578da88e06973af542.jpg"),
            ),
      ),
    );

    // return Scaffold(
    //   backgroundColor: Colors.purple,
    //   appBar: AppBar(
    //     backgroundColor: Colors.red,
    //     title: Text("Anatomy Of Flutter App"),
    //     centerTitle: true,
    //   ),
    //   body: Container(
    //     alignment: Alignment.center,
    //     color: Colors.blue,
    //     child: Column(
    //       children: <Widget>[
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           mainAxisSize: MainAxisSize.max,
    //           children: <Widget>[
    //             Center(
    //               child: Text("Row one"),
    //             ),
    //             Spacer(),
    //             Center(
    //                 child: Icon(
    //               Icons.star,
    //               size: 50,
    //               color: Colors.yellow,
    //             )),
    //           ],
    //         ),
    //         Image.network(
    //             "https://i.pinimg.com/236x/ca/76/0b/ca760b70976b52578da88e06973af542.jpg"),
    //       ],
    //     ),
    //   ),
    // );
  }
}
