import 'package:flutter/material.dart';
import 'package:responsive_container/responsive_container.dart';
import 'dart:convert';
import "../HomeScreen/VideoplayerScreen/videoplayer.dart";

class Cart extends StatelessWidget {
  // final String categoryName;
  // CategoryScreen({
  //   Key key,
  //   @required this.categoryName,
  // }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double sHeight, textHeight;
    if (height > 800) {
      sHeight = (height * 0.89) - 100;
      textHeight = 40;
    } else {
      sHeight = (height * 0.89) - 60;
      textHeight = 0;
    }
    return MaterialApp(
      home: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.grey[200],
          //   title: Text(
          //     "Trending Today",
          //     style: TextStyle(
          //       fontFamily: 'HelveticaMedium',
          //       fontSize: 20,
          //       // fontWeight: FontWeight.bold,
          //       color: Colors.black,
          //     ),
          //   ),
          //   leading: new IconButton(
          //     icon: new Icon(Icons.arrow_back, color: Colors.blue),
          //     onPressed: () => Navigator.pop(context),
          //   ),
          // ),
          body: Container(
        // height: sHeight,
        child: Column(
          children: <Widget>[
            // ResponsiveContainer(
            //   heightPercent: 5,
            //   widthPercent: 100,
            // child:
            // Container(
            //   height: 50,
            //   // padding: EdgeInsets.all(10),
            //   child: Text(
            //     "You have added following items in cart",
            //     style: TextStyle(
            //       fontFamily: 'HelveticaMedium',
            //       fontSize: 15,
            //       color: Colors.red,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // ),
            Container(
              child: Container(
                height: sHeight - 60,
                // widthPercent: 100,
                child: FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/data/dummy.json'),
                  builder: (context, snapshot) {
                    // Decode the JSON
                    List new_data = json.decode(snapshot.data.toString());
                    new_data.shuffle();

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
                                          height: 80,
                                          width: 80,
                                          child: new ClipRRect(
                                            borderRadius:
                                                new BorderRadius.circular(20.0),
                                            child: Image.network(
                                              new_data[index]['image'],
                                              fit: BoxFit.fill,
                                              height: 250,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                   
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Container(
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
                                            "" +
                                                new_data[index]['ratting'] +
                                                "",
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
            ButtonTheme(
              minWidth: 300.0,
              height: 60.0,
              child: new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.orange,
                onPressed: () {},
                child: new Text(
                  "CheckOut",
                  style: TextStyle(
                    fontFamily: 'HelveticaMedium',
                    fontSize: 18,
                    // color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
