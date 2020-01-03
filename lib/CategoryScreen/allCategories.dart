import 'package:flutter/material.dart';
import 'dart:convert';
import "../HomeScreen/VideoplayerScreen/videoplayer.dart";
import "./category.dart";

class AllCategoryScreen extends StatelessWidget {
  // final String categoryName;
  // AllCategoryScreen({
  //   Key key,
  //   @required this.categoryName,
  // }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text(
          "Categories",
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
        child: Container(
          // height: 180,
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/data/categories.json'),
            builder: (context, snapshot) {
              // Decode the JSON
              List new_data = json.decode(snapshot.data.toString());

              // print(new_data);
              return ListView.builder(
                // Build the ListView
                // scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    // width: 100,
                    height: 241,
                    // width: 140,
                    margin: EdgeInsets.only(left: 50, right: 50,top:15),
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey,
                          width:
                              0.2, //                   <--- border width here
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4.0,
                            offset: new Offset(1.0, 1.0),
                          ),
                        ]),
                    // padding: EdgeInsets.only(right: 12),
                    child:
                        // Container()
                        Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            GestureDetector(
                              child: Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  child: Container(
                                    height: 240,
                                    // width: 140,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: new ClipRRect(
                                      borderRadius: new BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      child: Image.network(
                                        new_data[index]['category_image'],
                                        fit: BoxFit.cover,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryScreen(
                                      categoryName: new_data[index]['category'],
                                    ),
                                  ),
                                );
                              },
                            ),
                            Positioned(
                              // padding: EdgeInsets.only(top: 5),
                              child: Container(
                                height: 30,
                                padding: EdgeInsets.only(bottom:0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(width: 0.1)
                                    // Colors.black.withOpacity(0.5)
                                    ),
                                child: Center(
                                  // alignment: Alignment.centerLeft,
                                  // padding: EdgeInsets.only(top: 2, left: 6),
                                  child: Text(
                                    "" + new_data[index]['category'] + "",
                                    style: TextStyle(
                                        fontFamily: 'HelveticaMedium',
                                        fontSize: 25,
                                        color: Colors.black

                                        // fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              bottom: 0,
                              left: 0,
                              right: 0,
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
