import 'package:car_rental/controllers/reservation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class DurationField extends StatelessWidget {
  final ReservationController reservationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Calculate the duration dynamically
      Duration duration = reservationController.returnDate.value
          .difference(reservationController.pickupDate.value);
      int totalDurationInHours = duration.inHours;

      // Calculate weeks and remaining days
      int weeks = totalDurationInHours ~/ (24 * 7);
      int remainingDays = (totalDurationInHours % (24 * 7)) ~/ 24;

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: 'Duration',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w300,
                fontSize: 14,
                letterSpacing: 0.3,
                color: const Color(0xFF1B1B1B),
              ),
              children: [
                TextSpan(
                  text: '*',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    height: 1.3,
                    letterSpacing: 0.3,
                    color: const Color(0xFFFF5C5C),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFDFDFFF)),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Text(
              '$weeks weeks, $remainingDays days',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                letterSpacing: 0.4,
                color: const Color(0xFF000000),
              ),
            ),
          ),
        ],
      );
    });
  }
}
