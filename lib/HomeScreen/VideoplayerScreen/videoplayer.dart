import "package:flutter/material.dart";
import 'package:responsive_container/responsive_container.dart';
import './gridData.dart';
import 'package:video_player/video_player.dart';
import "../../VideoPlayingSetiings/videoPlayingSettings.dart";
import 'dart:convert';

class ItemShow extends StatelessWidget {
  // Declare a field that holds the Todo.
  final String itemName;
  final String itemPrice;
  final String itemCategory;
  final String itemRattings;
  final String itemImage;
  final String itemDescription;
  final String itemOwner;

  // final String itemName;

  // In the constructor, require a Todo.
  ItemShow(
      {Key key,
      @required this.itemName,
      @required this.itemPrice,
      @required this.itemCategory,
      @required this.itemRattings,
      @required this.itemImage,
      @required this.itemDescription,
      @required this.itemOwner})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("data is ${videoUrl}");
    double height = MediaQuery.of(context).size.height;
    double videoHeight, imagecontainer;
    if (height > 800) {
      videoHeight = 30; //25
      imagecontainer = 5;
    } else {
      videoHeight = 25;
      imagecontainer = 0;
    }
    // print(videoUrl);
    // print(title);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Todos'),
      // ),
      body: Container(
        color: Colors.white,
        child: ResponsiveContainer(
          heightPercent: 100,
          widthPercent: 100,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: ResponsiveContainer(
                      heightPercent: 35.5,
                      widthPercent: 100,
                      padding: EdgeInsets.only(top: videoHeight),
                      child: new Container(
                        color: Colors.white,
                        child: Image.network(
                          itemImage,
                          fit: BoxFit.contain,
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                // color: Colors.red,
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: ResponsiveContainer(
                    heightPercent: 30 - imagecontainer,
                    widthPercent: 100,
                    child:
                        //  ListView(
                        //   padding: EdgeInsets.all(10),
                        //   children: <Widget>[
                        Column(
                      children: <Widget>[
                        Container(
                          // color: Colors.red,
                          alignment: Alignment.topLeft,
                          // padding: EdgeInsets.only(left: 7, right: 7),
                          child: Text(
                            "" + itemName + "",
                            style: TextStyle(
                                fontFamily: 'HelveticaMedium',
                                fontSize: 20,
                                color: Colors.black
                                // fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                            top: 5,
                          ),
                          child:
                          Row(children: <Widget>[
                            Column(children: <Widget>[
                            Row(
                            children: <Widget>[
                              Text(
                                "Price :",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'HelveticaMedium',
                                    fontSize: 13,

                                    // fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Container(width: 5),
                              Text(
                                itemPrice,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'HelveticaMedium',
                                    fontSize: 13,
                                    color: Colors.red

                                    // fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Container(width: 40),
                             
                            ],
                          ),
                         Row(
                            children: <Widget>[
                              Text(
                                "Ratings:",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'HelveticaMedium',
                                    fontSize: 13,

                                    // fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Container(width: 5),
                              Text(
                                itemRattings,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'HelveticaMedium',
                                    fontSize: 13,
                                    color: Colors.red

                                    // fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Container(width: 40),
                             
                            ],
                          ),

                          ],),
                           Expanded(flex: 1, child: Container()),
                          Container(
                            margin: EdgeInsets.only(right: 10),

                            child: Icon(
                              Icons.add_shopping_cart,
                              color: Colors.grey,
                            size: 35.0,
                            )
                            
                          )
                          ],)
                          
                           
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Container(
                            height: 1,
                            decoration: new BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.grey[300]),
                                color: Colors.grey[300]),
                          ),
                        ),
                        Container(
                          // color: Colors.teal,
                          padding: EdgeInsets.only(top: 5),
                          child: Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  child: new Container(
                                    decoration: new BoxDecoration(
                                      image: new DecorationImage(
                                        image: ExactAssetImage(
                                            'assets/images/profilepic.png'),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      itemOwner,
                                      style: TextStyle(
                                        fontFamily: 'HelveticaBold',
                                        fontSize: 15,

                                        // fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 5, top: 3),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 13,
                                    width: 13,
                                    child: new Container(
                                      decoration: new BoxDecoration(
                                        image: new DecorationImage(
                                          image: ExactAssetImage(
                                              'assets/images/facebook1.png'),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(flex: 1, child: Container()),
                              // Container(
                              //   // padding: EdgeInsets.only(top: 3),
                              //   decoration: new BoxDecoration(
                              //       border: Border.all(
                              //           width: .5, color: Colors.grey),
                              //       //new Color.fromRGBO(255, 0, 0, 0.0),
                              //       borderRadius: new BorderRadius.only(
                              //         topLeft: const Radius.circular(20.0),
                              //         topRight: const Radius.circular(20.0),
                              //         bottomLeft: const Radius.circular(20.0),
                              //         bottomRight: const Radius.circular(20.0),
                              //       ),
                              //       color: Colors.grey),
                              //   child: Container(
                              //     padding: EdgeInsets.only(
                              //         right: 5, left: 5, top: 2, bottom: 2),
                              //     child: Text(
                              //       "See All",
                              //       style: TextStyle(
                              //         fontFamily: 'HelveticaMedium',
                              //         fontSize: 10,
                              //         // fontWeight: FontWeight.bold,
                              //         color: Colors.white,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Container(
                          // color: Colors.red,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            itemDescription,
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 12,
                              color: Colors.grey
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Container(
                            height: 1,
                            decoration: new BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.grey[300]),
                                color: Colors.grey[300]),
                          ),
                        ),
                      ],
                    )
                    // ],
                    // ),
                    ),
              ),
              Container(
                child: ResponsiveContainer(
                  heightPercent: 32.9 + imagecontainer,
                  widthPercent: 100,
                  child: Column(
                    children: <Widget>[
                      Container(
                        // color: Colors.grey,

                        padding: EdgeInsets.all(10),
                        // color: Colors.,
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(right: 5),
                              child: Text(
                                "Popular Items",
                                style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontSize: 20,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 1,
                                // decoration: new BoxDecoration(
                                //     border: Border.all(
                                //         width: 1, color: Colors.grey[300]),
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
                              //     border: Border.all(
                              //         width: .5, color: Colors.grey[100]),
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
                                  "See All",
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
                        height: 150,
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: FutureBuilder(
                          future: DefaultAssetBundle.of(context)
                              .loadString('assets/data/dummy.json'),
                          builder: (context, snapshot) {
                            // Decode the JSON
                            List new_data =
                                json.decode(snapshot.data.toString());
                            new_data.shuffle();
                            // print(new_data);
                            return ListView.builder(
                              // Build the ListView
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: 120,
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
                                                  height: 100,
                                                  width: 110,
                                                  child: new ClipRRect(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(10.0),
                                                    child: Image.network(
                                                      new_data[index]['image'],
                                                      fit: BoxFit.fill,
                                                      height: 250,
                                                      width:
                                                          MediaQuery.of(context)
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
                                                  builder: (context) =>
                                                      ItemShow(
                                                    itemName: new_data[index]
                                                        ['itemname'],
                                                    itemCategory:
                                                        new_data[index]
                                                            ['category'],
                                                    itemImage: new_data[index]
                                                        ['image'],
                                                    itemPrice: new_data[index]
                                                        ['price'],
                                                    itemRattings:
                                                        new_data[index]
                                                            ['ratting'],
                                                    itemDescription:
                                                        new_data[index]
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
                                                "" +
                                                    new_data[index]
                                                        ['itemname'] +
                                                    "",
                                                style: TextStyle(
                                                    fontFamily:
                                                        'HelveticaMedium',
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
                                                "(" +
                                                    new_data[index]
                                                        ['price'] +
                                                    ")",
                                                style: TextStyle(
                                                    fontFamily:
                                                        'HelveticaMedium',
                                                    fontSize: 12,
                                                    color: Colors.grey
                                                    // fontWeight: FontWeight.bold,
                                                    ),
                                              ),
                                            ),
                                          )
                                          // Container(
                                          //   alignment: Alignment.centerLeft,
                                          //   padding: EdgeInsets.all(8),
                                          //   child: Row(
                                          //     children: <Widget>[
                                          //       Text(
                                          //         "" +
                                          //             new_data[index]['price'] +
                                          //             "",
                                          //         textAlign: TextAlign.left,
                                          //         style: TextStyle(
                                          //             fontFamily:
                                          //                 'HelveticaMedium',
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
                                          //         "" +
                                          //             new_data[index]
                                          //                 ['ratting'] +
                                          //             "",
                                          //         textAlign: TextAlign.left,
                                          //         style: TextStyle(
                                          //             fontFamily:
                                          //                 'HelveticaMedium',
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
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
