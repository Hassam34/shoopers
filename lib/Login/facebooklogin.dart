import "package:flutter/material.dart";
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import "../Navigation/navigation.dart";
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Facebooklogin extends StatefulWidget {
  // final VoidCallback onSignedIn;

  // Facebooklogin({Key key, @required this.onSignedIn}) : super(key: key);

  @override
  _FacebookloginState createState() => _FacebookloginState();
}

class _FacebookloginState extends State<Facebooklogin> {
  bool _isLoggedIn = false;
  Map userProfile;
  String name = "No body";
  final facebookLogin = FacebookLogin();

  // @override
  // void initState() {
  //   super.initState();

  //   if(FirebaseAuth.instance.currentUser() != null){

  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
  //       builder: (context) => Navigation()
  //     ));
  //   }

  // }
  _loginWithFB() async {
    print('facebooklogin callled');
    final result = await facebookLogin.logIn(['email', 'public_profile']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        AuthCredential credential =
            FacebookAuthProvider.getCredential(accessToken: token);

        FirebaseUser firebaseUser =
            (await FirebaseAuth.instance.signInWithCredential(credential)).user;
            
        print("Access token is ${token}");

        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);

        setState(() {
          userProfile = profile;
          _isLoggedIn = true;
          name = firebaseUser.email;
        });
        // widget.onSignedIn();
        break;

      case FacebookLoginStatus.cancelledByUser:
        print("Cancel");
        setState(() => _isLoggedIn = false);
        break;
      case FacebookLoginStatus.error:
        print(result.errorMessage);

        setState(() => _isLoggedIn = false);
        break;
    }
  }

  _logout() {
    facebookLogin.logOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _isLoggedIn
          ?
          Navigation()

              // Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       Image.network(userProfile["picture"]["data"]["url"], height: 50.0, width: 50.0,),
              //       Text(name+" HHAHAHA"),
              //       OutlineButton( child: Text("Logout"), onPressed: (){
              //         _logout();
              //       },)
              //     ],
              //   )
               :Center(
                  child: FacebookSignInButton(
                    onPressed: () {
                      _loginWithFB();
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
