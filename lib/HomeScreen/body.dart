import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import "package:flutter/material.dart";
import 'package:responsive_container/responsive_container.dart';
import 'package:http/http.dart' as http;
import 'package:vloggerpk/PopularItems/PopularItemsHome.dart';
import 'dart:convert';
import "./VideoplayerScreen/videoplayer.dart";
import 'package:video_player/video_player.dart';
import "../SearchBarScreen/searchBarScreen.dart";
import '../CategoryScreen/category.dart';
import "../CategoryScreen/allCategories.dart";

// import '../VideoPlayingSetiings/videoPlayingSettings.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // Future<Post> post;
  VideoPlayerController _controller;
  Future<void> futureController;
  List list = List();
  List data;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
    _controller = VideoPlayerController.network(
        'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        print("hello");
        setState(() {});
      });
    // futureController = _controller.initialize();
    // _controller.setLooping(true);
    // post = fetchPost();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=0cf790498275413a9247f8b94b3843fd");
    print(response.statusCode);
    if (response.statusCode == 200) {
      var temp = jsonDecode(response.body);
      list = temp['articles'] as List;
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

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

    // return
    // Container(
    // color: Colors.black,
    //   height: sHeight,
    //   child: Center(

    //     child: _controller.value.initialized
    //         ? AspectRatio(
    //             aspectRatio: _controller.value.aspectRatio,

    //             child:
    //             VideoPlayer(_controller),
    //           )
    //         : Container(),
    //   ),
    // );

    // floatingActionButton: FloatingActionButton(
    //   onPressed: () {
    //     setState(() {
    //       _controller.value.isPlaying
    //           ? _controller.pause()
    //           : _controller.play();
    //     });
    //   },
    //   child: Icon(
    //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
    //   ),
    // ),
    return Container(
      // color: Colors.red,
      child: Container(
        height: sHeight,
        margin: EdgeInsets.only(top: 15),
        child: ListView(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
          children: <Widget>[
            GestureDetector(
              child: ResponsiveContainer(
                heightPercent: 5,
                widthPercent: 100,
                child: Container(
                  // color: Colors.grey[200],
                  decoration: new BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey[200]),
                      //new Color.fromRGBO(255, 0, 0, 0.0),
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0),
                        bottomLeft: const Radius.circular(20.0),
                        bottomRight: const Radius.circular(20.0),
                      ),
                      color: Colors.grey[200]),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Search for your favourite receipes",
                            style: TextStyle(
                              fontFamily: 'HelveticaMedium',
                              fontSize: 15,
                              // fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ))
                    ],
                  ),
                ),
              ),

              //  Container(
              //   height: 80,
              //   // width:300,
              //   child: SearchBar(
              //     hintText: "Search for Favourite Receipes",
              //     searchBarStyle: SearchBarStyle(
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //   ),
              // ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchBody(),
                  ),
                );
              },
            ),

            Container(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 8,
              ),
              // color: Colors.,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 5),
                    // margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 1,
                      // decoration: new BoxDecoration(
                      //     border: Border.all(width: 1, color: Colors.grey[300]),
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
                    margin: const EdgeInsets.only(left: 5.0),
                    // padding: EdgeInsets.only(top: 3),
                    // decoration: new BoxDecoration(
                    //     border: Border.all(width: .5, color: Colors.grey[100]),
                    //     //new Color.fromRGBO(255, 0, 0, 0.0),
                    //     borderRadius: new BorderRadius.only(
                    //       topLeft: const Radius.circular(20.0),
                    //       topRight: const Radius.circular(20.0),
                    //       bottomLeft: const Radius.circular(20.0),
                    //       bottomRight: const Radius.circular(20.0),
                    //     ),
                    //     color: Colors.grey[100]),
                    child: Container(
                      padding:
                          EdgeInsets.only(right: 5, left: 5, top: 2, bottom: 2),
                      child: GestureDetector(
                        child: Text(
                          "See all",
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllCategoryScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: 111,
                // margin: EdgeInsets.only(top:5,bottom: 10),
                //  width: 160,
                child: FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/data/categories.json'),
                  builder: (context, snapshot) {
                    // Decode the JSON
                    List new_data = json.decode(snapshot.data.toString());
                    new_data.shuffle();
                    // print(new_data);
                    return ListView.builder(
                      // Build the ListView
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          // width: 100,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
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
                                          height: 110,
                                          width: 110,
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
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
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
                                            categoryName: new_data[index]
                                                ['category'],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Positioned(
                                    // padding: EdgeInsets.only(top: 5),
                                    child: Container(
                                      height: 20,
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
                                              fontSize: 12,
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
                )

// return Card(

                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.stretch,
                //     children: <Widget>[
                //       Text("Name: " + new_data[index]['itemname']),
                //       Text("ratting: " + new_data[index]['ratting']),
                //       Text("price: " + new_data[index]['price']),
                //       Text("category: " + new_data[index]['category'])
                //     ],
                //   ),
                // );
                // isLoading
                //     ? Center(
                //         child: CircularProgressIndicator(),
                //       )
                //     : ListView.builder(
                //         scrollDirection: Axis.horizontal,
                //         itemCount: list.length,
                //         itemBuilder: (BuildContext context, int index) {
                //           return Container(
                //               width: 100,
                //               padding: EdgeInsets.only(right: 12),
                //               child: Column(
                //                 children: <Widget>[
                //                   Column(children: <Widget>[
                //                     Align(
                //                       alignment: Alignment.center,
                //                       child: GestureDetector(
                //                         child: Container(
                //                           height: 80,
                //                           width: 80,
                //                           child: new Container(
                //                             decoration: new BoxDecoration(
                //                               border: Border.all(
                //                                   width: .5, color: Colors.grey),
                //                               borderRadius: new BorderRadius.only(
                //                                 topLeft:
                //                                     const Radius.circular(5.0),
                //                                 topRight:
                //                                     const Radius.circular(5.0),
                //                                 bottomLeft:
                //                                     const Radius.circular(5.0),
                //                                 bottomRight:
                //                                     const Radius.circular(5.0),
                //                               ),
                //                               image: new DecorationImage(
                //                                 image: ExactAssetImage(
                //                                     'assets/images/thumbnail.png'),
                //                                 fit: BoxFit.fitHeight,
                //                               ),
                //                             ),
                //                           ),
                //                         ),
                //                         onTap: () => {
                //                           setState(
                //                             () {
                //                               _controller.pause();
                //                             },
                //                           ),
                //                           // Navigator.push(
                //                           //   context,
                //                           //   MaterialPageRoute(
                //                           //     builder: (context) =>
                //                           //     Videoplayer(
                //                           //       videoUrl:
                //                           //           'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4',
                //                           //       title: list[index]['title'],
                //                           //     ),
                //                           //   ),
                //                           // )
                //                         },
                //                       ),
                //                     ),
                //                     // Container(
                //                     //   alignment: Alignment.centerLeft,
                //                     //   padding: EdgeInsets.only(top: 2, left: 6),
                //                     //   child: Text(
                //                     //     "" + list[index]['title'] + "",
                //                     //     style: TextStyle(
                //                     //       fontFamily: 'HelveticaMedium',
                //                     //       fontSize: 10,
                //                     //       // fontWeight: FontWeight.bold,
                //                     //     ),
                //                     //   ),
                //                     // ),
                //                     // Container(
                //                     //   alignment: Alignment.centerLeft,
                //                     //   padding: EdgeInsets.only(top: 2, left: 7),
                //                     //   child: Text(
                //                     //     "Morroo - 2 days 48k views ",
                //                     //     textAlign: TextAlign.left,
                //                     //     style: TextStyle(
                //                     //       fontFamily: 'HelveticaRegular',
                //                     //       fontSize: 9,

                //                     //       // fontWeight: FontWeight.bold,
                //                     //     ),
                //                     //   ),
                //                     // )
                //                   ]),
                //                 ],
                //               ));
                //         },
                //       ),
                ),
            Container(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 8,
              ),
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
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    // decoration: new BoxDecoration(
                    //     border: Border.all(width: .5, color: Colors.grey[100]),
                    //     //new Color.fromRGBO(255, 0, 0, 0.0),
                    //     borderRadius: new BorderRadius.only(
                    //       topLeft: const Radius.circular(20.0),
                    //       topRight: const Radius.circular(20.0),
                    //       bottomLeft: const Radius.circular(20.0),
                    //       bottomRight: const Radius.circular(20.0),
                    //     ),
                    //     color: Colors.grey[100]),
                    child: Container(
                      padding:
                          EdgeInsets.only(right: 5, left: 5, top: 2, bottom: 2),
                      child: GestureDetector(
                        child: Text(
                          "See all",
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        onTap: (){
                          Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PopularItemsHome()
                                        ),
                                      );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: 190,
                padding: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[50], width: 1)),
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
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 140,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.black, width: 0.1),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1.0,
                                  // offset: new Offset(1.0, 1.0),
                                ),
                              ]),
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
                                          height: 130,
                                          width: 140,
                                          padding: EdgeInsets.all(0.1),
                                          child: new ClipRRect(
                                            borderRadius: new BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10)),
                                            child: Image.network(
                                              new_data[index]['image'],
                                              fit: BoxFit.fill,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
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
                                            itemImage: new_data[index]['image'],
                                            itemPrice: new_data[index]['price'],
                                            itemRattings: new_data[index]
                                                ['ratting'],
                                            itemDescription: new_data[index]
                                                ['description'],
                                            itemOwner: new_data[index]['owner'],
                                          ),
                                        ),
                                      )
                                    },
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                            width: 0.1, color: Colors.black),
                                      ),
                                    ),
                                    padding: EdgeInsets.only(top: 5),
                                    // alignment: Alignment.centerLeft,
                                    child: Center(
                                      // alignment: Alignment.centerLeft,
                                      // padding: EdgeInsets.only(top: 2, left: 6),
                                      child: Text(
                                        "" + new_data[index]['itemname'] + "",
                                        //  textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: 'HelveticaMedium',
                                            fontSize: 13,
                                            color: Colors.grey
                                            // fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          "" + new_data[index]['price'] + "",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: 'HelveticaMedium',
                                              fontSize: 11,
                                              color: Colors.grey

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
                                              color: Colors.grey

                                              // fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  )
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
                )
                //  isLoading
                //     ? Center(
                //         child: CircularProgressIndicator(),
                //       )
                //     :
                //      ListView.builder(
                //         scrollDirection: Axis.horizontal,
                //         itemCount: list.length,
                //         itemBuilder: (BuildContext context, int index) {
                //           return Container(
                //               width: 120,
                //               padding: EdgeInsets.only(right: 12),
                //               child: Column(
                //                 children: <Widget>[
                //                   Column(children: <Widget>[
                //                     Align(
                //                       alignment: Alignment.center,
                //                       child: GestureDetector(
                //                         child: Container(
                //                           height: 100,
                //                           width: 100,
                //                           child: new Container(
                //                             decoration: new BoxDecoration(
                //                               border: Border.all(
                //                                   width: .5, color: Colors.grey),
                //                               borderRadius: new BorderRadius.only(
                //                                 topLeft:
                //                                     const Radius.circular(5.0),
                //                                 topRight:
                //                                     const Radius.circular(5.0),
                //                                 bottomLeft:
                //                                     const Radius.circular(5.0),
                //                                 bottomRight:
                //                                     const Radius.circular(5.0),
                //                               ),
                //                               image: new DecorationImage(
                //                                 image: ExactAssetImage(
                //                                     'assets/images/thumbnail.png'),
                //                                 fit: BoxFit.fitHeight,
                //                               ),
                //                             ),
                //                           ),
                //                         ),
                //                         onTap: () => {
                //                           setState(
                //                             () {
                //                               _controller.pause();
                //                             },
                //                           ),
                //                           // Navigator.push(
                //                           //   context,
                //                           //   MaterialPageRoute(
                //                           //     builder: (context) => Videoplayer(
                //                           //       videoUrl:
                //                           //           'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4',
                //                           //       title: list[index]['title'],
                //                           //     ),
                //                           //   ),
                //                           // )
                //                         },
                //                       ),
                //                     ),
                //                     // Container(
                //                     //   alignment: Alignment.centerLeft,
                //                     //   padding: EdgeInsets.only(top: 2, left: 6),
                //                     //   child: Text(
                //                     //     "" + list[index]['title'] + "",
                //                     //     style: TextStyle(
                //                     //       fontFamily: 'HelveticaMedium',
                //                     //       fontSize: 10,
                //                     //       // fontWeight: FontWeight.bold,
                //                     //     ),
                //                     //   ),
                //                     // ),
                //                     // Container(
                //                     //   alignment: Alignment.centerLeft,
                //                     //   padding: EdgeInsets.only(top: 2, left: 7),
                //                     //   child: Text(
                //                     //     "Morroo - 2 days 48k views ",
                //                     //     textAlign: TextAlign.left,
                //                     //     style: TextStyle(
                //                     //       fontFamily: 'HelveticaRegular',
                //                     //       fontSize: 9,

                //                     //       // fontWeight: FontWeight.bold,
                //                     //     ),
                //                     //   ),
                //                     // )
                //                   ]),
                //                 ],
                //               ));
                //         },
                //       ),
                ),
            Container(
              padding: EdgeInsets.only(
                top: 30,
                bottom: 8,
              ),
              // color: Colors.,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 5),
                    child: GestureDetector(
                      child: Text(
                        "Best Products for You ",
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      // onTap: () => {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => UserMain(
                      //             userName: "Irfan Junejo",
                      //           ),
                      //         ),
                      //       )
                      // }
                    ),
                  ),
                  // Expanded(
                  //   flex: 1,
                  //   child: Container(
                  //     height: 1,
                  //     decoration: new BoxDecoration(
                  //         border: Border.all(width: 1, color: Colors.grey[300]),
                  //         //new Color.fromRGBO(255, 0, 0, 0.0),
                  //         borderRadius: new BorderRadius.only(
                  //           topLeft: const Radius.circular(20.0),
                  //           topRight: const Radius.circular(20.0),
                  //           bottomLeft: const Radius.circular(20.0),
                  //           bottomRight: const Radius.circular(20.0),
                  //         ),
                  //         color: Colors.grey[300]),
                  //   ),
                  // ),
                  // Container(
                  //   // padding: EdgeInsets.only(top: 3),
                  //   decoration: new BoxDecoration(
                  //       border: Border.all(width: .5, color: Colors.grey[100]),
                  //       //new Color.fromRGBO(255, 0, 0, 0.0),
                  //       borderRadius: new BorderRadius.only(
                  //         topLeft: const Radius.circular(20.0),
                  //         topRight: const Radius.circular(20.0),
                  //         bottomLeft: const Radius.circular(20.0),
                  //         bottomRight: const Radius.circular(20.0),
                  //       ),
                  //       color: Colors.grey[100]),
                  //   child: Container(
                  //     padding:
                  //         EdgeInsets.only(right: 5, left: 5, top: 2, bottom: 2),
                  //     child: Text(
                  //       "See All",
                  //       style: TextStyle(
                  //         fontFamily: 'HelveticaMedium',
                  //         fontSize: 8,
                  //         // fontWeight: FontWeight.bold,
                  //         color: Colors.grey,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Container(
                height: 180,
                //  width: 160,
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
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black,
                              //   width: 0.1
                              // )
                              // color: Colors
                              ),
                          height: 150,
                          width: 150,
                          margin: EdgeInsets.only(left: 5, right: 5),
                          // padding: EdgeInsets.only(right: 12),
                          child:
                              // Container()
                              Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        child: new ClipRRect(
                                          borderRadius:
                                              new BorderRadius.circular(20.0),
                                          child: Image.network(
                                            new_data[index]['image'],
                                            fit: BoxFit.fill,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
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
                                  ),
                                  // Container(
                                  //   padding: EdgeInsets.only(top: 5),
                                  //   child: Center(
                                  //     // alignment: Alignment.centerLeft,
                                  //     // padding: EdgeInsets.only(top: 2, left: 6),
                                  //     child: Text(
                                  //       "" + new_data[index]['itemname'] + "",
                                  //       style: TextStyle(
                                  //           fontFamily: 'HelveticaMedium',
                                  //           fontSize: 12,
                                  //           color: Colors.blue
                                  //           // fontWeight: FontWeight.bold,
                                  //           ),
                                  //     ),
                                  //   ),
                                  // ),
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
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: new_data == null ? 0 : new_data.length,
                    );
                  },
                )),
            // Container(
            //   padding: EdgeInsets.only(
            //     top: 10,
            //     bottom: 8,
            //   ),
            //   // color: Colors.,
            //   child: Row(
            //     children: <Widget>[
            //       Container(
            //         padding: EdgeInsets.only(right: 5),
            //         child: GestureDetector(
            //             child: Text(
            //               "Rana Hamza Sheikh",
            //               style: TextStyle(
            //                 fontFamily: 'HelveticaBold',
            //                 fontSize: 12,
            //                 // fontWeight: FontWeight.bold,
            //                 // color: Colors.red,
            //               ),
            //             ),
            //             onTap: () => {
            //                   Navigator.push(
            //                     context,
            //                     MaterialPageRoute(
            //                       builder: (context) => UserMain(
            //                         userName: "Rana Hamza Sheikh",
            //                       ),
            //                     ),
            //                   )
            //                 }),
            //       ),
            //       Expanded(
            //         flex: 1,
            //         child: Container(
            //           height: 1,
            //           decoration: new BoxDecoration(
            //               border: Border.all(width: 1, color: Colors.grey[300]),
            //               //new Color.fromRGBO(255, 0, 0, 0.0),
            //               borderRadius: new BorderRadius.only(
            //                 topLeft: const Radius.circular(20.0),
            //                 topRight: const Radius.circular(20.0),
            //                 bottomLeft: const Radius.circular(20.0),
            //                 bottomRight: const Radius.circular(20.0),
            //               ),
            //               color: Colors.grey[300]),
            //         ),
            //       ),
            //       Container(
            //         // padding: EdgeInsets.only(top: 3),
            //         decoration: new BoxDecoration(
            //             border: Border.all(width: .5, color: Colors.grey[100]),
            //             //new Color.fromRGBO(255, 0, 0, 0.0),
            //             borderRadius: new BorderRadius.only(
            //               topLeft: const Radius.circular(20.0),
            //               topRight: const Radius.circular(20.0),
            //               bottomLeft: const Radius.circular(20.0),
            //               bottomRight: const Radius.circular(20.0),
            //             ),
            //             color: Colors.grey[100]),
            //         child: Container(
            //           padding:
            //               EdgeInsets.only(right: 5, left: 5, top: 2, bottom: 2),
            //           child: Text(
            //             "See All",
            //             style: TextStyle(
            //               fontFamily: 'HelveticaMedium',
            //               fontSize: 8,
            //               // fontWeight: FontWeight.bold,
            //               color: Colors.grey,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   height: 220,
            //   //  width: 160,
            //   child: isLoading
            //       ? Center(
            //           child: CircularProgressIndicator(),
            //         )
            //       : ListView.builder(
            //           scrollDirection: Axis.horizontal,
            //           itemCount: list.length,
            //           itemBuilder: (BuildContext context, int index) {
            //             return Container(
            //                 width: 210,
            //                 padding: EdgeInsets.only(right: 12),
            //                 child: Column(
            //                   children: <Widget>[
            //                     Column(children: <Widget>[
            //                       Align(
            //                         alignment: Alignment.center,
            //                         child: GestureDetector(
            //                           child: Container(
            //                             height: 145,
            //                             width: 190,
            //                             child: new Container(
            //                               decoration: new BoxDecoration(
            //                                 border: Border.all(
            //                                     width: .5, color: Colors.grey),
            //                                 borderRadius: new BorderRadius.only(
            //                                   topLeft:
            //                                       const Radius.circular(5.0),
            //                                   topRight:
            //                                       const Radius.circular(5.0),
            //                                   bottomLeft:
            //                                       const Radius.circular(5.0),
            //                                   bottomRight:
            //                                       const Radius.circular(5.0),
            //                                 ),
            //                                 image: new DecorationImage(
            //                                   image: ExactAssetImage(
            //                                       'assets/images/thumbnail.png'),
            //                                   fit: BoxFit.fitHeight,
            //                                 ),
            //                               ),
            //                             ),
            //                           ),
            //                           onTap: () => {
            //                              setState(
            //                               () {
            //                                 _controller.pause();
            //                               },
            //                             ),
            //                             Navigator.push(
            //                               context,
            //                               MaterialPageRoute(
            //                                 builder: (context) => Videoplayer(
            //                                   videoUrl:
            //                                       'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4',
            //                                   title: list[index]['title'],
            //                                 ),
            //                               ),
            //                             )
            //                           },
            //                         ),
            //                       ),
            //                       Container(
            //                         alignment: Alignment.centerLeft,
            //                         padding: EdgeInsets.only(top: 2, left: 6),
            //                         child: Text(
            //                           "" + list[index]['title'] + "",
            //                           style: TextStyle(
            //                             fontFamily: 'HelveticaMedium',
            //                             fontSize: 10,
            //                             // fontWeight: FontWeight.bold,
            //                           ),
            //                         ),
            //                       ),
            //                       Container(
            //                         alignment: Alignment.centerLeft,
            //                         padding: EdgeInsets.only(top: 2, left: 7),
            //                         child: Text(
            //                           "Morroo - 2 days 48k views ",
            //                           textAlign: TextAlign.left,
            //                           style: TextStyle(
            //                             fontFamily: 'HelveticaRegular',
            //                             fontSize: 9,

            //                             // fontWeight: FontWeight.bold,
            //                           ),
            //                         ),
            //                       )
            //                     ]),
            //                   ],
            //                 ));
            //           },
            //         ),
            // ),
          ],
        ),
      ),
    );
  }
}
