import 'package:flutter/material.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import "../main.dart";

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double vlogerHeight, profilepic;
    if (height > 800) {
      vlogerHeight = 8;
      profilepic = 4;
    } else {
      vlogerHeight = 0;
      profilepic = 0;
    }
    return Container(
      // padding: EdgeInsets.only(top:10),
      color: Colors.grey[200],
      child: ResponsiveContainer(
        heightPercent: 11,
        widthPercent: 100,
        padding: EdgeInsets.only(top: 15),
        child: Container(
          // color: Colors.redAccent,
          padding: EdgeInsets.only(),
          child: Column(
            children: <Widget>[
              Container(
                  child: Row(
                children: <Widget>[
                  // ResponsiveContainer(
                  //   heightPercent: 7.3,
                  //   widthPercent: 12,
                  //   padding: EdgeInsets.only(top: 18),
                    // child: Container(
                    //   child: Align(
                    //     alignment: Alignment.bottomCenter,
                    //     child: ResponsiveContainer(
                    //       heightPercent: 7.3,
                    //       widthPercent: 9,
                    //       child: new Container(
                    //         decoration: new BoxDecoration(
                    //           image: new DecorationImage(
                    //             image: ExactAssetImage(
                    //                 'assets/images/mainlogo.png'),
                    //             fit: BoxFit.fitWidth,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  // ),
                  ResponsiveContainer(
                    heightPercent: 7.3,
                    widthPercent: 59,
                    padding: EdgeInsets.only(top: 19, left: 5),
                    child: Container(
                      // color: Colors.red,
                      padding: EdgeInsets.only(top: vlogerHeight),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: ResponsiveContainer(
                          heightPercent: 9,
                          widthPercent: 68,
                          child: Text(
                            "Discover",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'HelveticaBold', fontSize: 19),
                          ),
                        ),
                      ),
                    ),
                  ),
                   ResponsiveContainer(
                    heightPercent: 7.3,
                    widthPercent: 12,
                   ),
                  ResponsiveContainer(
                    heightPercent: 7.3,
                    widthPercent: 9,
                    // child:
                    //  Container(
                    //     padding: EdgeInsets.only(top: 18),
                    //     child: GestureDetector(
                    //       child: Icon(
                    //         Icons.search,
                    //         color: Colors.red,
                    //         size: 21.0,
                    //         // semanticLabel: 'Text to announce in accessibility modes',
                    //       ),
                    //       // onTap: () {
                    //       //   final facebookLogin = FacebookLogin();
                    //       //   facebookLogin.logOut();
                    //       //   Navigator.push(
                    //       //     context,
                    //       //     MaterialPageRoute(
                    //       //       builder: (context) => MyApp(),
                    //       //     ),
                    //       //   );
                    //       // },
                    //     )),
                  ),
                  ResponsiveContainer(
                    heightPercent: 7.3,
                    widthPercent: 9,
                    // child: Container(
                    //     padding: EdgeInsets.only(top: 18),
                    //     child: GestureDetector(
                    //       child: Icon(
                    //         Icons.notifications_none,
                    //         color: Colors.black,
                    //         size: 25.0,
                    //         // semanticLabel: 'Text to announce in accessibility modes',
                    //       ),
                    //       // onTap: () {
                    //       //   final facebookLogin = FacebookLogin();
                    //       //   facebookLogin.logOut();
                    //       //   Navigator.push(
                    //       //     context,
                    //       //     MaterialPageRoute(
                    //       //       builder: (context) => MyApp(),
                    //       //     ),
                    //       //   );
                    //       // },
                    //     )),
                  ),
                  ResponsiveContainer(
                    heightPercent: 7.3,
                    widthPercent: 11,
                     child: Container(
                        padding: EdgeInsets.only(top: 18),
                        child: GestureDetector(
                          child: Icon(
                            Icons.notifications_none,
                            color: Colors.black,
                            size: 25.0,
                            // semanticLabel: 'Text to announce in accessibility modes',
                          ),
                        ),)
                    // child:
                    //  Container(
                    //   padding: EdgeInsets.only(top: 18),
                    //   child: Align(
                    //     // alignment: Alignment.bottomCenter,
                    //     child: Container(
                    //       height: 40,
                    //       width: 42,
                    //       padding: EdgeInsets.only(
                    //           left: 6 - profilepic, right: 6 - profilepic),
                    //       child: new Container(
                    //         decoration: new BoxDecoration(
                    //           // border: Border.all(
                    //           //             width: .5, color: Colors.black),
                    //           //new Color.fromRGBO(255, 0, 0, 0.0),
                    //           borderRadius: new BorderRadius.only(
                    //             topLeft: const Radius.circular(100.0),
                    //             topRight: const Radius.circular(100.0),
                    //             bottomLeft: const Radius.circular(100.0),
                    //             bottomRight: const Radius.circular(100.0),
                    //           ),
                    //           color: Colors.grey,
                    //           image: new DecorationImage(
                    //             image: ExactAssetImage(
                    //                 "assets/images/profilepic.png"),
                    //             fit: BoxFit.fitHeight,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  )
                ],
              )
                  // Row(
                  //   children: <Widget>[
                  //     ResponsiveContainer(
                  //       heightPercent: 10,
                  //       widthPercent: 12,
                  //       padding: EdgeInsets.only(top: 15, left: 4),
                  //       child: Align(
                  //         alignment: Alignment.center,
                  //         child: ResponsiveContainer(
                  //           heightPercent: 80,
                  //           widthPercent: 10,
                  //           child: new Container(
                  //             decoration: new BoxDecoration(
                  //               image: new DecorationImage(
                  //                 image: ExactAssetImage(
                  //                     'assets/images/mainlogo.png'),
                  //                 fit: BoxFit.fitWidth,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     ResponsiveContainer(
                  //       heightPercent: 100,
                  //       widthPercent: 68,
                  //       padding: EdgeInsets.only(top: 20),
                  //       child: Align(
                  //         alignment: Alignment.center,
                  //         child: ResponsiveContainer(
                  //           heightPercent: 100,
                  //           widthPercent: 68,
                  //           child: Text(
                  //             "Vlogger.PK",
                  //             style: TextStyle(
                  //                 fontFamily: 'HelveticaBold', fontSize: 20),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     ResponsiveContainer(
                  //       heightPercent: 100,
                  //       widthPercent: 8,
                  //       padding: EdgeInsets.only(top: 18),
                  //       child: Icon(
                  //         Icons.search,
                  //         color: Colors.red,
                  //         size: 25.0,
                  //         // semanticLabel: 'Text to announce in accessibility modes',
                  //       ),
                  //     ),
                  //     ResponsiveContainer(
                  //       heightPercent: 100,
                  //       widthPercent: 10,
                  //       padding: EdgeInsets.only(top: 15),
                  //       child: Align(
                  //         alignment: Alignment.center,
                  //         child: ResponsiveContainer(
                  //           heightPercent: 20,
                  //           widthPercent: 70,
                  //           child: new Container(
                  //             decoration: new BoxDecoration(
                  //               image: new DecorationImage(
                  //                 image: ExactAssetImage(
                  //                     'assets/images/profilepic.png'),
                  //                 fit: BoxFit.contain,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
