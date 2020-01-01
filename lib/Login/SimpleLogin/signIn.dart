import 'package:flutter/material.dart';
import 'package:responsive_container/responsive_container.dart';
import 'dart:ui';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import "../../Navigation/navigation.dart";
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double loginHeight = 100;
    double emailHeight = loginHeight + 50;
    double password = emailHeight + 80;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final facebookLogin = FacebookLogin();

    _loginWithFB() async {
    print('facebooklogin callled');
    final result = await facebookLogin.logIn(['email', 'public_profile']);
    print("result is: ${result.status}");
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        // break;
        final token = result.accessToken.token;
        // final graphResponse = await http.get(
        //     'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        // AuthCredential credential =
        //     FacebookAuthProvider.getCredential(accessToken: token);

        // FirebaseUser firebaseUser =
        //     (await FirebaseAuth.instance.signInWithCredential(credential)).user;
            
        print("Access token is ${token}");
        Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Navigation()),
                            );

        // final profile = JSON.jsonDecode(graphResponse.body);
        // print(profile);

        // setState(() {
        //   userProfile = profile;
        //   _isLoggedIn = true;
        //   name = firebaseUser.email;
        // });
        // widget.onSignedIn();
        break;

      case FacebookLoginStatus.cancelledByUser:
        print("Cancel");
        // setState(() => _isLoggedIn = false);
        break;
      case FacebookLoginStatus.error:
        print(result.errorMessage);

    //     setState(() => _isLoggedIn = false);
    //     break;
    }
  }

    return Scaffold(
        body: Container(
      width: width,
      child: new Stack(
        children: <Widget>[
          // new Container(
          //   decoration: new BoxDecoration(
          //     color: Colors.black87,
          //     image: new DecorationImage(
          //       image: new AssetImage("assets/images/background.png"),
          //       fit: BoxFit.cover,
          //       colorFilter: new ColorFilter.mode(
          //           Colors.black.withOpacity(.7), BlendMode.dstATop),
          //     ),
          //   ),
          // ),
          ResponsiveContainer(
            heightPercent: 100,
            widthPercent: 100,
            child: Container(
              child: Column(
                children: <Widget>[
                  ResponsiveContainer(
                    heightPercent: 13,
                    widthPercent: 100,
                    child: Container(
                      // color: Colors.pinkAccent,
                      child: Text(""),
                    ),
                  ),
                  ResponsiveContainer(
                    heightPercent: 9,
                    widthPercent: 100,
                    child: Container(
                      // color: Colors.pink,
                      child: Center(
                        // padding: EdgeInsets.only(
                        //   left: 10,
                        // ),
                        // alignment: Alignment.centerLeft,
                        // color: Colors.black,
                        child: Text(
                          "Shoppers",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: 'HelveticaBold',
                              // color: Colors.white,
                              fontSize: 35),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: ResponsiveContainer(
                      heightPercent: 32,
                      widthPercent: 80,
                      child: Container(
                        // color: Colors.indigo,
                        child: Center(
                          child: Container(
                            // height: 145,
                            // width: 190,
                            child: new Container(
                              decoration: new BoxDecoration(
                                border:
                                    Border.all(width: .5, color: Colors.grey),
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
                          ),
                        ),
                        // Container(
                        //   padding: EdgeInsets.only(left: 10, right: 10),
                        //   child: new TextFormField(
                        //     // obscureText: true,
                        //     decoration: new InputDecoration(
                        //       // labelText: "Enter Email",
                        //       hintText: "Email Address",
                        //       // focusColor: Colors.grey[300],
                        //       filled: true,
                        //       fillColor: Colors.white70,
                        //       border: new OutlineInputBorder(
                        //         borderRadius: new BorderRadius.circular(8.0),
                        //         // borderSide: new BorderSide(color: Colors.white),
                        //       ),
                        //     ),
                        //     validator: (val) {
                        //       if (val.length == 0) {
                        //         return "Email cannot be empty";
                        //       } else {
                        //         return null;
                        //       }
                        //     },
                        //     keyboardType: TextInputType.emailAddress,
                        //     style: new TextStyle(
                        //       fontFamily: "Poppins",
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                  // ResponsiveContainer(
                  //   heightPercent: 3,
                  //   widthPercent: 100,
                  //   child: Container(
                  //     color: Colors.redAccent,
                  //   ),
                  // ),
                  // ResponsiveContainer(
                  //   heightPercent: 9,
                  //   widthPercent: 100,
                  //   child: Container(
                  //     color: Colors.green,
                  //     child: Container(
                  //       padding:
                  //           EdgeInsets.only( left: 10, right: 10),
                  //       child: new TextFormField(
                  //         obscureText: true,
                  //         decoration: new InputDecoration(
                  //           // labelText: "Enter Email",
                  //           hintText: "Password",
                  //           filled: true,
                  //           fillColor: Colors.white70,
                  //           border: new OutlineInputBorder(
                  //             borderRadius: new BorderRadius.circular(8.0),
                  //             // borderSide: new BorderSide(color: Colors.white),
                  //           ),
                  //         ),
                  //         validator: (val) {
                  //           if (val.length == 0) {
                  //             return "Password cannot be empty";
                  //           } else {
                  //             return null;
                  //           }
                  //         },
                  //         // keyboardType: TextInputType.visiblePassword,
                  //         style: new TextStyle(
                  //           fontFamily: "Poppins",
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // ResponsiveContainer(
                  //   heightPercent: 7,
                  //   widthPercent: 100,
                  //   child: Container(
                  //     color: Colors.redAccent,
                  //   ),
                  // ),
                  ResponsiveContainer(
                    heightPercent: 1,
                    widthPercent: 100,
                    child: Container(
                        // color: Colors.yellow,

                        ),
                  ),
                  ResponsiveContainer(
                    heightPercent: 15,
                    widthPercent: 100,
                    child: Column(
                      // color: Colors.deepOrange,
                      children: <Widget>[
                        FacebookSignInButton(
                          onPressed: () {
                            _loginWithFB();
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => Navigation()),
                            // );
                          },
                        ),
                        GoogleSignInButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Navigation()),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  ResponsiveContainer(
                    heightPercent: 4,
                    widthPercent: 100,
                    child: Center(
                        // color: Colors.redAccent,
                        ),
                  ),
                  ResponsiveContainer(
                      heightPercent: 12,
                      widthPercent: 70,
                      child: Column(
                        children: <Widget>[
                          Center(
                            // color: Colors.lightBlue,
                            child: Text(
                              "These Terms and Conditions and any policies or operating rules posted by us on the Site .",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: 'HelveticaBold',
                                  color: Colors.grey,
                                  fontSize: 12),
                            ),
                          ),
                          Center(
                            // color: Colors.lightBlue,
                            child: Text(
                              "Privacy Policy",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: 'HelveticaBold',
                                  // color: Colors.grey,
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      )),
                  ResponsiveContainer(
                    heightPercent: 7,
                    widthPercent: 100,
                    child: Container(
                        // color: Colors.grey,
                        ),
                  ),
                  ResponsiveContainer(
                    heightPercent: 7,
                    widthPercent: 70,
                    child: Container(
                        padding: EdgeInsets.only(left: 30),
                        child: Column(
                          children: <Widget>[
                            Center(
                              // color: Colors.lightBlue,
                              child: Text(
                                "ALready have account then simply click facebook or Google button to LogIn",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: 'HelveticaBold',
                                    // color: Colors.grey,
                                    fontSize: 10),
                              ),
                            ),
                            // Center(
                            //   // color: Colors.lightBlue,
                            //   child: Text(
                            //       "Log In",
                            //       textAlign: TextAlign.start,
                            //       style: TextStyle(
                            //           fontFamily: 'HelveticaBold',
                            //           // color: Colors.grey,
                            //           fontSize: 12),
                            //     ),
                            // ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),

          // child: Stack(
          // Container(
          //   padding: EdgeInsets.only(left: 10, top: loginHeight),
          //   // color: Colors.black,
          //   child: Text(
          //     "Log In",
          //     textAlign: TextAlign.start,
          //     style: TextStyle(
          //         fontFamily: 'HelveticaBold',
          //         color: Colors.white,
          //         fontSize: 25),
          //   ),
          // ),
          // Container(
          //   padding: EdgeInsets.only(top: emailHeight, left: 10, right: 10),
          //   child: new TextFormField(
          //     // obscureText: true,
          //     decoration: new InputDecoration(
          //       // labelText: "Enter Email",
          //       hintText: "Email Address",
          //       // focusColor: Colors.grey[300],
          //       filled: true,
          //       fillColor: Colors.white70,
          //       border: new OutlineInputBorder(
          //         borderRadius: new BorderRadius.circular(8.0),
          //         // borderSide: new BorderSide(color: Colors.white),
          //       ),
          //     ),
          //     validator: (val) {
          //       if (val.length == 0) {
          //         return "Email cannot be empty";
          //       } else {
          //         return null;
          //       }
          //     },
          //     keyboardType: TextInputType.emailAddress,
          //     style: new TextStyle(
          //       fontFamily: "Poppins",
          //     ),
          //   ),
          // ),
          // Container(
          //   padding: EdgeInsets.only(top: password, left: 10, right: 10),
          //   child: new TextFormField(
          //     obscureText: true,
          //     decoration: new InputDecoration(
          //       // labelText: "Enter Email",
          //       hintText: "Password",
          //       filled: true,
          //       fillColor: Colors.white70,
          //       border: new OutlineInputBorder(
          //         borderRadius: new BorderRadius.circular(8.0),
          //         // borderSide: new BorderSide(color: Colors.white),
          //       ),
          //     ),
          //     validator: (val) {
          //       if (val.length == 0) {
          //         return "Password cannot be empty";
          //       } else {
          //         return null;
          //       }
          //     },
          //     // keyboardType: TextInputType.visiblePassword,
          //     style: new TextStyle(
          //       fontFamily: "Poppins",
          //     ),
          //   ),
          // ),
          // ),
          // ],
          // ),
          // ),
        ],
      ),
    ));
  }
}

// assets/images/thumbnail.png
