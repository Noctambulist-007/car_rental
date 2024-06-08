import 'package:car_rental/models/car.dart';
import 'package:car_rental/ui/widgets/info_container.dart';
import 'package:car_rental/ui/widgets/info_row.dart';
import 'package:car_rental/ui/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:car_rental/controllers/car_controller.dart';
import 'package:car_rental/controllers/customer_info_controller.dart';
import 'package:car_rental/controllers/reservation_controller.dart';

class SummaryScreen extends StatelessWidget {
  final CarController carController = Get.find();
  final ReservationController reservationController = Get.find();
  final CustomerInfoController customerInfoController = Get.find();

  @override
  Widget build(BuildContext context) {
    final Car selectedCar = carController.selectedCar.value;

    int durationInHours = reservationController.duration.value;
    Duration duration = Duration(hours: durationInHours);

    double hourlyCharge = selectedCar.hourlyRate * duration.inHours.toDouble();
    double dailyCharge = selectedCar.dailyRate * duration.inDays.toDouble();
    double weeklyCharge =
        selectedCar.weeklyRate * (duration.inDays ~/ 7).toDouble();

    // Calculate total charges
    double totalCharges = hourlyCharge + dailyCharge + weeklyCharge;

    // Additional charges
    List<double> additionalCharges = [9.00, 15.00, 11.50];
    double additionalChargesTotal = additionalCharges.reduce((a, b) => a + b);

    // Net total
    double netTotal = totalCharges + additionalChargesTotal;

    return Scaffold(
      appBar: AppBar(
        title: Text('Back'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, size: 15),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        padding: EdgeInsets.fromLTRB(21, 52.5, 18, 58),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(title: 'Reservation Details'),
              InfoContainer(
                children: [
                  InfoRow(
                      label: 'Reservation ID',
                      value:
                          reservationController.reservationId.value.toString()),
                  SizedBox(height: 10),
                  InfoRow(
                      label: 'Pickup Date',
                      value: reservationController.getFormattedDate(
                          reservationController.pickupDate.value)),
                  SizedBox(height: 10),
                  InfoRow(
                      label: 'Dropoff Date',
                      value: reservationController.getFormattedDate(
                          reservationController.returnDate.value)),
                ],
              ),
              SectionHeader(title: 'Customer Information'),
              InfoContainer(
                children: [
                  InfoRow(
                      label: 'First Name',
                      value: customerInfoController.firstName.value),
                  SizedBox(height: 10),
                  InfoRow(
                      label: 'Last Name',
                      value: customerInfoController.lastName.value),
                  SizedBox(height: 10),
                  InfoRow(
                      label: 'Email',
                      value: customerInfoController.email.value),
                  SizedBox(height: 10),
                  InfoRow(
                      label: 'Phone',
                      value: customerInfoController.phone.value),
                ],
              ),
              SectionHeader(title: 'Vehicle Information'),
              InfoContainer(
                children: [
                  InfoRow(label: 'Vehicle Type', value: selectedCar.type),
                  SizedBox(height: 10),
                  InfoRow(label: 'Vehicle Model', value: selectedCar.model),
                ],
              ),
              SectionHeader(title: 'Charges Summary'),
              Container(
                color: Color(0xFFDFDFFF),
                child: InfoContainer(
                  children: [
                    Row(
                      children: [
                        Text('Charges',
                            style: GoogleFonts.getFont('Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                letterSpacing: 0.3,
                                color: Color(0xFF1B1B1B))),
                        Spacer(),
                        Text('Total',
                            style: GoogleFonts.getFont('Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                letterSpacing: 0.3,
                                color: Color(0xFF1B1B1B))),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(color: Color(0xFF5D5CFF), thickness: 1),
                    InfoRow(
                        label: 'Hourly',
                        value: '\$${hourlyCharge.toStringAsFixed(2)}'),
                    SizedBox(height: 10),
                    InfoRow(
                        label: 'Daily',
                        value: '\$${dailyCharge.toStringAsFixed(2)}'),
                    SizedBox(height: 10),
                    InfoRow(
                        label: 'Weekly',
                        value: '\$${weeklyCharge.toStringAsFixed(2)}'),
                    SizedBox(height: 10),
                    InfoRow(
                        label: 'Additional Charges',
                        value:
                            '\$${additionalChargesTotal.toStringAsFixed(2)}'),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text('Net Total',
                            style: GoogleFonts.getFont('Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                letterSpacing: 0.3,
                                color: Color(0xFF1B1B1B))),
                        Spacer(),
                        Text('\$${netTotal.toStringAsFixed(2)}',
                            style: GoogleFonts.getFont('Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                letterSpacing: 0.3,
                                color: Color(0xFF1B1B1B))),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
