import 'package:car_rental/controllers/reservation_controller.dart';
import 'package:car_rental/ui/widgets/next_button.dart';
import 'package:car_rental/ui/widgets/reservation_form.dart';
import 'package:car_rental/ui/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'customer_information_screen.dart';

class ReservationDetailsScreen extends StatelessWidget {
  final ReservationController reservationController =
      Get.put(ReservationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SectionHeader(title: 'Reservation Details'),
              ReservationForm(),
              NextButton(destination: CustomerInformationScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
