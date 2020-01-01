import "package:flutter/material.dart";
import "../HomeScreen/home.dart";
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:responsive_container/responsive_container.dart';
import "../SearchBarScreen/searchBarScreen.dart";

class Navigation extends StatefulWidget {
  // final Map fbData;

  // Navigation({Key key, @required this.fbData}) : super(key: key);
  // final token="EAAGVmy3sth0BAFCj2KLKvNSZAUmHyOJ5HWAMCinfK5pBSa8WweVL6IoTEd53OT6cBZC92mNVXz2dZA5K9y8nk65g9LUHTBx6Nt38RZBoZAvIRTweGEZAimPse2JZCxqXv7nqZCM2PDAjSShZBkglmUWt9YjaJ3G2r1jfZBQDr0k4mYZCnE5wf3c9ljwQxdsjRZAhXQfvyF5BxnXzj2uT3AhkEZAbF9Ygv9c5ejFMZD";
  // final graphResponse = http.get(
  //           'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [Home(), Home(), Home(), Home(), Home()];
  void onTap(int index) {
    // print(widget.showddd);
    setState(() {
      _currentIndex = index;
    });
  }

  showData() async {
    //1774572052675606
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double nHeight = height > 800 ? 100 : 60;
    // showData();
    return Scaffold(
      body: _children[_currentIndex],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0), // here the desired height
        child: AppBar(
          iconTheme: new IconThemeData(color: Colors.black),
          backgroundColor: Colors.grey[300],
          title: Container(
            child: Text(
              "Discover",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'HelveticaBold',
                  color: Colors.black,
                  fontSize: 19),
            ),
          ),
          actions: <Widget>[
            Icon(
              Icons.notifications_none,
              color: Colors.black,
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      size: 35.0,
                      color: Colors.white,
                    ),
                    Container(
                    padding: EdgeInsets.all(20),
                      child:Text("user@gamil.com",style:TextStyle(color: Colors.white, fontSize: 12) ,) ,)
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.menu),
              title: Text('Home'),
              onTap: () {},
            ),
            // ListTile(
            //   leading: Icon(Icons.shopping_basket),
            //   title: Text('My deals'),
            //   onTap: () {},
            // ),
            // ListTile(
            //   leading: Icon(Icons.favorite),
            //   title: Text('Faviourites'),
            //   onTap: () {},
            // ),
            // ListTile(
            //   leading: Icon(Icons.trending_up),
            //   title: Text('Trending deals'),
            //   onTap: () {},
            // ),
            // ListTile(
            //   leading: Icon(Icons.store),
            //   title: Text('Stores'),
            //   onTap: () {},
            // ),
            // ListTile(
            //   leading: Icon(Icons.category),
            //   title: Text('Categories'),
            //   onTap: () {},
            // ),
            // ListTile(
            //   leading: Icon(Icons.add_alert),
            //   title: Text('Deal alerts'),
            //   onTap: () {},
            // ),
            // ListTile(
            //   leading: Icon(Icons.add_box),
            //   title: Text('Rewards'),
            //   onTap: () {},
            // ),
            // ListTile(
            //   leading: Icon(Icons.get_app),
            //   title: Text('Refer and Earn'),
            //   onTap: () {},
            // ),
            // ListTile(
            //   leading: Icon(Icons.money_off),
            //   title: Text('Refer and Earn'),
            //   onTap: () {},
            // ),
            // ListTile(
            //   leading: Icon(Icons.rate_review),
            //   title: Text('Rate the App'),
            //   onTap: () {},
            // ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: nHeight,
        child: BottomNavigationBar(
          selectedItemColor: Colors.red,
          type: BottomNavigationBarType.fixed,
          onTap: onTap,
          currentIndex:
              _currentIndex, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              title: Text('Cart'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.favorite),
            //   title: Text('Favourite'),
            // ),
            
            
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            )
          ],
        ),
      ),
    );
  }
}
