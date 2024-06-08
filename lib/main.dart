import 'package:car_rental/ui/screens/reservation_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_rental/controllers/car_controller.dart';
import 'package:car_rental/controllers/reservation_controller.dart';

void main() {
  runApp(CarRentalApp());
}

class CarRentalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Car Rental Service',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(CarController());
        Get.put(ReservationController());
      }),
      home: ReservationDetailsScreen(),
    );
  }
}
