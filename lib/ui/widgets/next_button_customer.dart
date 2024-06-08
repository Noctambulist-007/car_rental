import 'package:car_rental/controllers/customer_info_controller.dart';
import 'package:car_rental/ui/screens/vehicle_information_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonCustomer extends StatelessWidget {
  final CustomerInfoController customerInfoController = Get.find();
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  NextButtonCustomer({
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customerInfoController.firstName.value = firstNameController.text;
        customerInfoController.lastName.value = lastNameController.text;
        customerInfoController.email.value = emailController.text;
        customerInfoController.phone.value = phoneController.text;

        Get.to(VehicleInformationScreen());
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF5D5CFF),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          width: 175,
          padding: const EdgeInsets.symmetric(vertical: 13.5),
          child: Text(
            'Next',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 0.3,
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}
