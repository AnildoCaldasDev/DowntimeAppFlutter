import 'package:downtime_app_flutter/model/product.model.dart';
import 'package:downtime_app_flutter/repositories/product.repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//api used in this example: https://api.balta.io/v1/courses
//link base example: Balta.io youtube repository pattern in flutter

class ProductRepositoryPage extends StatefulWidget {
  @override
  _ProductRepositoryPageState createState() => _ProductRepositoryPageState();
}

class _ProductRepositoryPageState extends State<ProductRepositoryPage> {
  // List<ProductModel> _products = new List<ProductModel>();
  ProductRepository _repository = new ProductRepository();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: _repository.getProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return new Center(
                  child: Text(
                "Carregando...",
                style: TextStyle(color: Colors.pink, fontSize: 20),
              ));
              break;
            default:
              if (snapshot.hasError) {
                return new Text(snapshot.error);
              } else {
                return productsListView(context, snapshot);
              }
          }
        });
  }

  Widget productsListView(BuildContext context, AsyncSnapshot snapshot) {
    List<ProductModel> products = snapshot.data;

    return new ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            new Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.all(10),
                    child: new ListTile(title: new Text(products[index].title)),
                  ),
                ),
                Divider(),
                Expanded(
                  // child: Container(
                  //   alignment: Alignment.centerRight,
                  child:
                      new ListTile(title: new Text(products[index].category)),
                  //),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
