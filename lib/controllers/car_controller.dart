import 'package:get/get.dart';
import 'package:car_rental/models/car.dart';

class CarController extends GetxController {
  var cars = <Car>[].obs;
  var selectedCar = Car(
    id: '',
    make: '',
    model: '',
    year: 0,
    type: '',
    seats: 0,
    bags: 0,
    hourlyRate: 0,
    dailyRate: 0,
    weeklyRate: 0,
    imageURL: '',
  ).obs;

  @override
  void onInit() {
    fetchCars();
    super.onInit();
  }

  void fetchCars() {
    var dummyData = [
      {
        "id": "1",
        "make": "Toyota",
        "model": "Camry",
        "year": 2020,
        "type": "Sedan",
        "seats": 5,
        "bags": 2,
        "rates": {"hourly": 20, "daily": 100, "weekly": 500},
        "imageURL": "https://example.com/toyota_camry.jpg"
      },
    ];

    cars.value = dummyData.map((carJson) => Car.fromJson(carJson)).toList();
  }

  void selectCar(Car car) {
    selectedCar.value = car;
  }
}
