import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import '../Navigation/navigation.dart';
import "./facebooklogin.dart";

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

enum AuthState { signedIn, notSignIn }

class _AuthenticationState extends State<Authentication> {
  AuthState authState = AuthState.notSignIn;

  Future<String>currentuser() async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    currentuser().then((userId){
          print(userId);
      setState(() {
        authState = userId==null ?  AuthState.notSignIn : AuthState.signedIn;
      });
    });

  }

  signedIN(){
    setState(() {
        authState = AuthState.signedIn;
      });
  }

  @override
  Widget build(BuildContext context) {
    switch (authState) {
      case AuthState.notSignIn:
        return Facebooklogin();
      case AuthState.signedIn:
        return Navigation();
    }
  }
}
