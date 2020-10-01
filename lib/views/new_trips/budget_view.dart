import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewTripsBudgetView extends StatelessWidget {
  // ignore: deprecated_member_use
  final db = Firestore.instance;
  final Trip trip;
  NewTripsBudgetView({Key key, @required this.trip}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Trip - Budget'),
      ),
      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Enter A Budget',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
          Text('Location ${trip.title}'),
          Text('Start Date ${trip.startDate}'),
          Text('End Date ${trip.endDate}'),
          RaisedButton(
              child: Text('Finish'),
              color: Colors.blue,
              onPressed: () async {
                await db.collection("trips").add(trip.tojson());

                Navigator.of(context).popUntil((route) => route.isFirst);
              })
        ]),
      ),
    );
  }
}
