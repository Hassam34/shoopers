import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:responsive_container/responsive_container.dart';
import "./videoplayer.dart";

class GridData extends StatefulWidget {
  @override
  _GridDataState createState() => _GridDataState();
}

class _GridDataState extends State<GridData> {
  List list = List();
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchData();

    // post = fetchPost();
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
    return ResponsiveContainer(
      heightPercent: 44,
      widthPercent: 100,
      child: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        padding: EdgeInsets.all(8),
        // Generate 100 widgets that display their index in the List.
        children: List.generate(list.length, (index) {
          return isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ResponsiveContainer(
                  heightPercent: 44,
                  widthPercent: 100,
                  padding: EdgeInsets.only(right: 8, left: 8),
                  child: Column(
                    children: <Widget>[
                      Column(children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: ResponsiveContainer(
                            heightPercent: 16,
                            widthPercent: 100,
                            child: GestureDetector(
                              child: new Container(
                                decoration: new BoxDecoration(
                                  // border: Border.all(
                                  //     width: .5, color: Colors.grey),
                                  borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(5.0),
                                    topRight: const Radius.circular(5.0),
                                    bottomLeft: const Radius.circular(5.0),
                                    bottomRight: const Radius.circular(5.0),
                                  ),
                                  image: new DecorationImage(
                                    image: ExactAssetImage(
                                        'assets/images/thumbnail.png'),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                              // onTap: () => {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => Videoplayer(
                              //         // videoUrl:
                              //         //     'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4',
                              //         title: list[index]['title'],
                              //       ),
                              //     ),
                              //   )
                              // },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(top: 3, left: 3),
                          child: Text(
                            "" + list[index]['title'] + "",
                            style: TextStyle(
                              fontFamily: 'HelveticaMedium',
                              fontSize: 9.5,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                            child: Row(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(top: 3, left: 3),
                              child: Text(
                                "Morroo - 2 days 48k views ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'HelveticaRegular',
                                  fontSize: 8.5,

                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(top: 3, left: 3),
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 11,
                                  width: 11,
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
                          ],
                        )),
                      ]),
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
