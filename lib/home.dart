import 'package:flutter/material.dart';
import 'package:travel_app/views/explore_view.dart';
import 'package:travel_app/views/home_view.dart';
import 'package:travel_app/views/new_trips/location_view.dart';
import 'package:travel_app/views/pastTrip_view.dart';
import 'package:travel_app/views/profile_view.dart';
import 'package:travel_app/models/trip.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeView(),
    Exploreview(),
    PastTripview(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final primaryColor = const Color(0xFF75A2EA);
    final newTrip = new Trip(null, null, null, null, null);
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel App'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.add,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewTripsLocationView(
                              trip: newTrip,
                            )));
              })
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black45,
        fixedColor: primaryColor,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // ignore: deprecated_member_use
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            // ignore: deprecated_member_use
            title: Text('Explore'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            // ignore: deprecated_member_use
            title: Text('Past Trips'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            // ignore: deprecated_member_use
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
