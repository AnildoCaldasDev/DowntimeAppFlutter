import 'package:downtime_app_flutter/model/chatstructure.model.dart';
import 'package:flutter/material.dart';
import 'package:signalr_client/signalr_client.dart';

class ChatApp extends StatefulWidget {
  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  final textController = new TextEditingController();
  final nameTextController = new TextEditingController();
  final hubConnection =
      HubConnectionBuilder().withUrl("http://192.168.0.102:80/chatHub").build();

  final List<ChatStructureModel> messages = new List<ChatStructureModel>();

  @override
  void initState() {
    super.initState();

    hubConnection.onclose((_) {
      print('Conexão Perdida');
    });

    hubConnection.on("ReceiveMessage", onReceiveMessage);

    startConnection();
  }

  void startConnection() async {
    await hubConnection.start(); //inicia a conexao com o servidor
  }

  void onReceiveMessage(List<Object> result) {
    setState(() {
      messages.add(ChatStructureModel(
          from: result[0].toString() + ": ", message: result[1]));
    });
  }

  void sendMessage() async {
    await hubConnection.invoke("SendMessage", args: <Object>[
      nameTextController.text,
      textController.text
    ]).catchError((err) {
      print(err);
    });

    setState(() {
      textController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: nameTextController,
              autofocus: false,
              textCapitalization: TextCapitalization.sentences,
              decoration:
                  InputDecoration(labelText: "Nome ou Apelido no Chat:"),
            ),
            Divider(
              height: 20,
            ),
            Container(
              child: Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 5),
                      child: Row(
                        children: <Widget>[
                          Text(
                            messages[i].from,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              messages[i].message,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.blue[100],
        padding: const EdgeInsets.all(10.0),
        height: 120,
        child: TextFormField(
          controller: textController,
          keyboardType: TextInputType.multiline,
          maxLines: 2,
          autocorrect: false,
          autofocus: true,
          textCapitalization: TextCapitalization.none,
          enableSuggestions: false,
          decoration: InputDecoration(labelText: "Mensagem"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: () {
          sendMessage();
        },
      ),
    );
  }
}
