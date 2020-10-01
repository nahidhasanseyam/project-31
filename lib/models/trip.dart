class Trip {
  String title;
  DateTime startDate;
  DateTime endDate;
  double budget;
  String travelType;

  Trip(this.budget, this.endDate, this.startDate, this.title, this.travelType);

  Map<String, dynamic> tojson() => {
        "title": title,
        "startDate": startDate,
        "endDate": endDate,
        "budget": budget,
        "travelType": travelType
      };
}
