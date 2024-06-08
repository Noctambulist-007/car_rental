import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButton extends StatelessWidget {
  final Widget destination;

  const NextButton({required this.destination});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(destination);
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
