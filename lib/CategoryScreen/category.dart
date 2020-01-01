import 'package:flutter/material.dart';
import 'dart:convert';
import "../HomeScreen/VideoplayerScreen/videoplayer.dart";

class CategoryScreen extends StatelessWidget {
  final String categoryName;
  CategoryScreen({
    Key key,
    @required this.categoryName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text(
          categoryName,
          style: TextStyle(
            fontFamily: 'HelveticaMedium',
            fontSize: 20,
            // fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        child: Center(
          // height: 180,
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/data/dummy.json'),
            builder: (context, snapshot) {
              // Decode the JSON
              List ew_data = json.decode(snapshot.data.toString());
              ew_data.shuffle();
              List new_data = new List();
              int i;
              for (i = 0; i < ew_data.length; i++) {
                if (ew_data[i]['category'] == categoryName) {
                  new_data.add(ew_data[i]);
                }
              }
              // print(new_data);
              return ListView.builder(
                // Build the ListView
                // scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    // width: 130,
                    // padding: EdgeInsets.only(right: 12),
                    child:
                        // Container()
                        Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              child: Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  child: Container(
                                    height: 120,
                                    width: 120,
                                    child: new ClipRRect(
                                      borderRadius:
                                          new BorderRadius.circular(20.0),
                                      child: Image.network(
                                        new_data[index]['image'],
                                        fit: BoxFit.fill,
                                        height: 250,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ItemShow(
                                      itemName: new_data[index]['itemname'],
                                      itemCategory: new_data[index]['category'],
                                      itemImage: new_data[index]['image'],
                                      itemPrice: new_data[index]['price'],
                                      itemRattings: new_data[index]['ratting'],
                                      itemDescription: new_data[index]
                                          ['description'],
                                      itemOwner: new_data[index]['owner'],
                                    ),
                                  ),
                                )
                              },
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              child: Center(
                                // alignment: Alignment.centerLeft,
                                // padding: EdgeInsets.only(top: 2, left: 6),
                                child: Text(
                                  "" + new_data[index]['itemname'] + "",
                                  style: TextStyle(
                                      fontFamily: 'HelveticaMedium',
                                      fontSize: 12,
                                      color: Colors.blue
                                      // fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.all(8),
                              child: Center(
                                child: Row(
                                  children: <Widget>[
                                     Expanded(
                                      child: Container(),
                                      flex: 1,
                                    ),
                                    Text(
                                      "" + new_data[index]['price'] + "",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: 'HelveticaMedium',
                                          fontSize: 11,
                                          color: Colors.red

                                          // fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Expanded(
                                      child: Container(),
                                      flex: 1,
                                    ),
                                    Text(
                                      "" + new_data[index]['ratting'] + "",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: 'HelveticaMedium',
                                          fontSize: 11,
                                          color: Colors.orange[300]
                                          // fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                     Expanded(
                                      child: Container(),
                                      flex: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: new_data == null ? 0 : new_data.length,
              );
            },
          ),
        ),
      ),
    ));
  }
}
