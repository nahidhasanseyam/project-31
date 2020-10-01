import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/views/new_trips/budget_view.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'dart:async';
import 'package:intl/intl.dart';

class NewTripsDateView extends StatefulWidget {
  final Trip trip;
  NewTripsDateView({Key key, @required this.trip}) : super(key: key);

  @override
  _NewTripsDateViewState createState() => _NewTripsDateViewState();
}

class _NewTripsDateViewState extends State<NewTripsDateView> {
  DateTime _startDate = DateTime.now();

  DateTime _endDate = DateTime.now().add(Duration(days: 7));

  Future displayDateRangePicker(BuildContext context) async {
    final List<DateTime> picked = await DateRangePicker.showDatePicker(
      context: context,
      initialFirstDate: _startDate,
      initialLastDate: _endDate,
      firstDate: DateTime(DateTime.now().year - 50),
      lastDate: DateTime(DateTime.now().year + 50),
    );
    if (picked != null && picked.length == 2) {
      setState(() {
        _startDate = picked[0];
        _endDate = picked[1];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Trip - Date'),
      ),
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Location ${widget.trip.title}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
                child: Text('Select Date'),
                color: Colors.blue,
                onPressed: () async {
                  await displayDateRangePicker(context);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Start Date: ${DateFormat('MM/dd/yyyy').format(_startDate).toString()}',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 15),
                ),
                Text(
                  'Start Date: ${DateFormat('MM/dd/yyyy').format(_endDate).toString()}',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 15),
                ),
              ],
            ),
          ),
          RaisedButton(
              child: Text('Continue'),
              color: Colors.blue,
              onPressed: () {
                widget.trip.startDate = _startDate;
                widget.trip.endDate = _endDate;

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewTripsBudgetView(
                              trip: widget.trip,
                            )));
              })
        ]),
      ),
    );
  }
}
