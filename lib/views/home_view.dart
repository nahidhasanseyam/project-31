import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travel_app/models/trip.dart';
import 'package:intl/intl.dart';

class HomeView extends StatelessWidget {
  final List<Trip> tripList = [
    Trip(200.0, DateTime.now(), DateTime.now(), 'Savar', '1Bike'),
    Trip(300.0, DateTime.now(), DateTime.now(), 'Nobinogar', '2Bike'),
    Trip(100.0, DateTime.now(), DateTime.now(), 'Chattogram', '3Bike'),
    Trip(500.0, DateTime.now(), DateTime.now(), 'Borishal', '4Bike'),
    Trip(100.0, DateTime.now(), DateTime.now(), 'Noakhali', '5Bike'),
    Trip(600.0, DateTime.now(), DateTime.now(), 'chari', '6Bike'),
    Trip(200.0, DateTime.now(), DateTime.now(), 'london', '1Bike'),
    Trip(300.0, DateTime.now(), DateTime.now(), 'los ange', '2Bike'),
    Trip(100.0, DateTime.now(), DateTime.now(), 'honkon', '3Bike'),
    Trip(500.0, DateTime.now(), DateTime.now(), 'india', '4Bike'),
    Trip(100.0, DateTime.now(), DateTime.now(), 'bd', '5Bike'),
    Trip(600.0, DateTime.now(), DateTime.now(), 'srilonka', '6Bike'),
    Trip(200.0, DateTime.now(), DateTime.now(), 'nator', '1Bike'),
    Trip(300.0, DateTime.now(), DateTime.now(), 'khulna', '2Bike'),
    Trip(100.0, DateTime.now(), DateTime.now(), 'ju', '3Bike'),
    Trip(500.0, DateTime.now(), DateTime.now(), 'du', '4Bike'),
    Trip(100.0, DateTime.now(), DateTime.now(), 'coxs', '5Bike'),
    Trip(600.0, DateTime.now(), DateTime.now(), 'moyna', '6Bike')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: tripList.length,
          itemBuilder: (BuildContext context, int index) =>
              buildTripCard(context, index)),
    );
  }

  Widget buildTripCard(BuildContext context, int index) {
    final trip = tripList[index];
    return Container(
      color: Colors.black12,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 4),
                child: Row(
                  children: [
                    Text(
                      trip.title,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 76),
                child: Row(
                  children: [
                    Text(
                        '${DateFormat('dd/MM/yyyy').format(trip.startDate).toString()} - ${DateFormat('dd/MM/yyyy').format(trip.endDate).toString()}'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 6),
                child: Row(
                  children: [
                    Text(
                      '\$${trip.budget.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Spacer(),
                    Text(trip.travelType),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(Icons.bike_scooter)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
