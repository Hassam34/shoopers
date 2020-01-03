import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import "../HomeScreen/header.dart";
import './searchBarBody.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../HomeScreen/VideoplayerScreen/videoplayer.dart';
import 'package:responsive_container/responsive_container.dart';

class SearchBodyNew extends StatefulWidget {
  @override
  SearchBarScreenNew createState() => SearchBarScreenNew();
}

class SearchBarScreenNew extends State<SearchBodyNew> {
  Future<void> futureController;
  List list = List();
  var isLoading = false;
  String searchname;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {}

  @override
  Widget build(BuildContext context) {
    void onSearchName(data) {
      setState(() => searchname = data);
    }

    return MaterialApp(
      home: Container(
        child: Scaffold(
          resizeToAvoidBottomInset:false,
          // appBar: AppBar(
          //   leading: new IconButton(
          //     icon: new Icon(Icons.arrow_back, color: Colors.blue),
          //     onPressed: () => Navigator.pop(context),
          //   ),
          //   title: Text(
          //     "Search",
          //     style: TextStyle(
          //       fontFamily: 'HelveticaMedium',
          //       fontSize: 20,
          //       // fontWeight: FontWeight.bold,
          //       color: Colors.black,
          //     ),
          //   ),
          //   backgroundColor: Colors.grey[200],
          // ),
          body: Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Hello I am Treva What would you like to Search ?",
                    style: TextStyle(
                      fontFamily: 'Helvetica',
                      fontSize: 25,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: new TextFormField(
                    onChanged: (text) {
                      setState(() => searchname = text);
                      print(searchname);
                    },
                    // obscureText: true,
                    decoration: new InputDecoration(
                      // labelText: "Enter Email",
                      hintText: "Search your favourite items",
                      // focusColor: Colors.grey[300],
                      filled: true,
                      fillColor: Colors.white70,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                        // borderSide: new BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "Email cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  // color: Colors.,
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 5),
                        child: Text(
                          "Favorite",
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 20,
                            // fontWeight: FontWeight.bold,
                            // color: Colors.red,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 1,
                          // decoration: new BoxDecoration(
                          //     border:
                          //         Border.all(width: 1, color: Colors.grey[300]),
                          //     //new Color.fromRGBO(255, 0, 0, 0.0),
                          //     borderRadius: new BorderRadius.only(
                          //       topLeft: const Radius.circular(20.0),
                          //       topRight: const Radius.circular(20.0),
                          //       bottomLeft: const Radius.circular(20.0),
                          //       bottomRight: const Radius.circular(20.0),
                          //     ),
                          //     color: Colors.grey[300]),
                        ),
                      ),
                      Container(
                        // padding: EdgeInsets.only(top: 3),
                        // decoration: new BoxDecoration(
                        //     border:
                        //         Border.all(width: .5, color: Colors.grey[100]),
                        //     //new Color.fromRGBO(255, 0, 0, 0.0),
                        //     borderRadius: new BorderRadius.only(
                        //       topLeft: const Radius.circular(20.0),
                        //       topRight: const Radius.circular(20.0),
                        //       bottomLeft: const Radius.circular(20.0),
                        //       bottomRight: const Radius.circular(20.0),
                        //     ),
                        //     color: Colors.grey[100]),
                        child: Container(
                          padding: EdgeInsets.only(
                              right: 5, left: 5, top: 2, bottom: 2),
                          child: Text(
                            "See all",
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 15,
                              // fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 180,
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
                        if (ew_data[i]['itemname']== searchname) {
                          new_data.add(ew_data[i]);
                        }
                      }
                      // print(new_data);
                      return ListView.builder(
                        // Build the ListView
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 130,
                            padding: EdgeInsets.only(right: 12),
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
                                                  new BorderRadius.circular(
                                                      10.0),
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
                                      onTap: () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ItemShow(
                                              itemName: new_data[index]
                                                  ['itemname'],
                                              itemCategory: new_data[index]
                                                  ['category'],
                                              itemImage: new_data[index]
                                                  ['image'],
                                              itemPrice: new_data[index]
                                                  ['price'],
                                              itemRattings: new_data[index]
                                                  ['ratting'],
                                              itemDescription: new_data[index]
                                                  ['description'],
                                              itemOwner: new_data[index]
                                                  ['owner'],
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
                                          "" + new_data[index]['itemname'],
                                          style: TextStyle(
                                              fontFamily: 'HelveticaMedium',
                                              fontSize: 12,
                                              color: Colors.black
                                              // fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // padding: EdgeInsets.only(top: 5),
                                      child: Center(
                                        // alignment: Alignment.centerLeft,
                                        // padding: EdgeInsets.only(top: 2, left: 6),
                                        child: Text(
                                          "(" + new_data[index]['price'] + ")",
                                          style: TextStyle(
                                              fontFamily: 'HelveticaMedium',
                                              fontSize: 11,
                                              color: Colors.grey
                                              // fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                                    // Container(
                                    //   alignment: Alignment.centerLeft,
                                    //   padding: EdgeInsets.all(8),
                                    //   child: Row(
                                    //     children: <Widget>[
                                    //       Text(
                                    //         "" + new_data[index]['price'] + "",
                                    //         textAlign: TextAlign.left,
                                    //         style: TextStyle(
                                    //             fontFamily: 'HelveticaMedium',
                                    //             fontSize: 11,
                                    //             color: Colors.red

                                    //             // fontWeight: FontWeight.bold,
                                    //             ),
                                    //       ),
                                    //       Expanded(
                                    //         child: Container(),
                                    //         flex: 1,
                                    //       ),
                                    //       Text(
                                    //         "" + new_data[index]['ratting'] + "",
                                    //         textAlign: TextAlign.left,
                                    //         style: TextStyle(
                                    //             fontFamily: 'HelveticaMedium',
                                    //             fontSize: 11,
                                    //             color: Colors.orange[300]

                                    //             // fontWeight: FontWeight.bold,
                                    //             ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // )
                                    // )
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
