import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChargeItem extends StatelessWidget {
  final String label;
  final double value;
  final bool isSelected;
  final bool isPercentage;
  final ValueChanged<bool?> onChanged;

  const ChargeItem({
    required this.label,
    required this.value,
    required this.isSelected,
    required this.onChanged,
    this.isPercentage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isSelected,
          onChanged: onChanged,
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            letterSpacing: 0.4,
            color: Color(0xFF000000),
          ),
        ),
        Spacer(),
        Text(
          isPercentage
              ? '${value.toStringAsFixed(2)}%'
              : '\$${value.toStringAsFixed(2)}',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            letterSpacing: 0.4,
            color: Color(0xFF000000),
          ),
        ),
      ],
    );
  }
}
