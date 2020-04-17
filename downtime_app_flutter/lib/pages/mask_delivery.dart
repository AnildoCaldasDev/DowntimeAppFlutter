import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:downtime_app_flutter/model/mask_delivery_item.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MaskDelivery extends StatefulWidget {
  var itemsDelivered = new List<MaskDeliveryItem>();

  MaskDelivery() {
    itemsDelivered = [];
  }

  @override
  _MaskDeliveryState createState() => _MaskDeliveryState();
}

class _MaskDeliveryState extends State<MaskDelivery> {
  _MaskDeliveryState() {
    load();
  }

  String code = "";

  scannQrCode() async {
    try {
      final result = await BarcodeScanner.scan();
      setState(() {
        code = result;
        widget.itemsDelivered.add(
          MaskDeliveryItem(
              userid: code,
              dateDelivery:
                  new DateFormat('dd-MM-yyyy hh:mm:ss').format(DateTime.now())),
        );
        code = "";
      });
      //add();
    } catch (e) {
      print(e);
    }
  }

  // void add() {
  //   setState(() {
  //     widget.itemsDelivered.add(
  //       MaskDeliveryItem(userid: code, dateDelivery: DateTime.now()),
  //     );
  //     code = "";
  //     save();
  //   });
  // }

  save() async {
    print("save");
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('masks', jsonEncode(widget.itemsDelivered));
  }

  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('masks');
    if (data != null) {
      Iterable decoded = jsonDecode(data);

      List<MaskDeliveryItem> result =
          decoded.map((x) => MaskDeliveryItem.fromJson(x)).toList();
      setState(() {
        widget.itemsDelivered = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(
      //   elevation: 0.0,
      //   title: Text("Todo List",
      //       style: TextStyle(fontSize: 18, color: textTitleFuturistic)),
      //   actions: <Widget>[
      //     Icon(Icons.plus_one),
      //   ],
      //   centerTitle: true,
      //   backgroundColor: backGroundColorFuturistic,
      // ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: new Container(
                  child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Covid19 - Entrega de Mascaras",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.cloud_upload,
                        size: 30, color: Colors.blueAccent[400]),
                    tooltip: "Fazer Upload de Dados",
                    onPressed: save,
                  ),
                ],
              )),
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: widget.itemsDelivered.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = widget.itemsDelivered[index];
                  return Dismissible(
                    key: Key(item.userid),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 20),
                      child: Text(
                        item.userid +
                            "   Data: " +
                            item.dateDelivery.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    background: Container(
                      child: Center(
                        child: Text("Excluindo..."),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: Colors.red.withOpacity(0.5)),
                    ),
                    onDismissed: (direction) {
                      print(direction);
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        onPressed: scannQrCode,
        child: Icon(
          Icons.add,
          size: 30,
        ),
        backgroundColor: Colors.blueAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
