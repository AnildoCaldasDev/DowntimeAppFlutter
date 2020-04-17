//import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:downtime_app_flutter/model/items.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

//import '../theme.dart';

class TodoList extends StatefulWidget {
  var items = new List<Item>();

  TodoList() {
    items = [];
  }

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  var newTaskController = TextEditingController();

  _TodoListState() {
    load();
  }

  void add() {
    if (newTaskController.text.isEmpty) return;
    setState(() {
      widget.items.add(
        Item(title: newTaskController.text, done: false),
      );
      newTaskController.clear();
      save();
    });
  }

  void remove(int index) {
    setState(() {
      widget.items.removeAt(index);
      save();
    });
  }

  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');
    if (data != null) {
      Iterable decoded = jsonDecode(data);

      List<Item> result = decoded.map((x) => Item.fromJson(x)).toList();
      setState(() {
        widget.items = result;
      });
    }
  }

  save() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(widget.items));
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
                    child: TextFormField(
                      controller: newTaskController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        labelText: "Novo Item",
                      ),
                      // validator: (value) {
                      // if (value.isEmpty) {
                      //   return "Preencha o Item corretamente.";
                      // } else {
                      //   return null;
                      // }
                      //}
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.save,
                        size: 30, color: Colors.blueAccent[400]),
                    tooltip: "Salvar Item!",
                    onPressed: add,
                  ),
                ],
              )),
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: widget.items.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = widget.items[index];
                  return Dismissible(
                    key: Key(item.title),
                    child: CheckboxListTile(
                      title: Text(item.title),
                      value: item.done,
                      onChanged: (value) {
                        setState(() {
                          item.done = value;
                          save();
                        });
                      },
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
                      remove(index);
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
        onPressed: add,
        child: Icon(
          Icons.add,
          size: 30,
        ),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
