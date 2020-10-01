import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/views/new_trips/date_view.dart';

class NewTripsLocationView extends StatelessWidget {
  final Trip trip;
  NewTripsLocationView({Key key, @required this.trip}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController _titleComtroller = new TextEditingController();
    _titleComtroller.text = trip.title;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Trip - Location'),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Enter A Location',
            style: TextStyle(color: Colors.blue, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(21.0),
          child: TextField(
            controller: _titleComtroller,
            autofocus: true,
            decoration: InputDecoration(
                labelText: "Enter Location",
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide(),
                )),
          ),
        ),
        RaisedButton(
            child: Text('Continue'),
            color: Colors.blue,
            onPressed: () {
              trip.title = _titleComtroller.text;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewTripsDateView(
                            trip: trip,
                          )));
            })
      ]),
    );
  }
}
