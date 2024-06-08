class Car {
  final String id;
  final String make;
  final String model;
  final String type;
  final int seats;
  final int year;
  final int bags;
  final String imageURL;
  final int hourlyRate;
  final int dailyRate;
  final int weeklyRate;

  Car({
    required this.id,
    required this.make,
    required this.model,
    required this.type,
    required this.seats,
    required this.year,
    required this.bags,
    required this.imageURL,
    required this.hourlyRate,
    required this.dailyRate,
    required this.weeklyRate,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      make: json['make'],
      model: json['model'],
      type: json['type'],
      seats: json['seats'],
      year: json['year'],
      bags: json['bags'],
      imageURL: json['imageURL'],
      hourlyRate: json['rates']['hourly'],
      dailyRate: json['rates']['daily'],
      weeklyRate: json['rates']['weekly'],
    );
  }
}
