import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool requiredField;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final Function(String)? onChanged;

  const CustomTextField({
    required this.label,
    this.requiredField = false,
    this.suffixIcon,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w300,
              fontSize: 14,
              letterSpacing: 0.3,
              color: const Color(0xFF1B1B1B),
            ),
            children: requiredField
                ? [
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
                  ]
                : [],
          ),
        ),
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: const Color(0xFFDFDFFF)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: const Color(0xFFDFDFFF)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: const Color(0xFFDFDFFF)),
            ),
            labelText: '',
            suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          ),
        ),
      ],
    );
  }
}
