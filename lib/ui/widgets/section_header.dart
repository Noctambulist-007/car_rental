import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            letterSpacing: 0.4,
            color: const Color(0xFF000000),
          ),
        ),
        Divider(color: const Color(0xFF5D5CFF), thickness: 1),
        SizedBox(height: 30),
      ],
    );
  }
}
