import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:car_rental/models/car.dart';

class CarService {
  static const String apiUrl =
      'https://exam-server-7c41747804bf.herokuapp.com/carsList';

  Future<List<Car>> fetchCars() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Car> cars =
          (data['data'] as List).map((car) => Car.fromJson(car)).toList();
      return cars;
    } else {
      throw Exception('Failed to load cars');
    }
  }
}
