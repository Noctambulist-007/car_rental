import 'package:car_rental/ui/screens/reservation_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_text_field.dart';

class DateField extends StatelessWidget {
  final String label;
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  DateField({
    required this.label,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController dateController = TextEditingController(
      text: DateFormat('hh:mm a, d MMMM yyyy').format(selectedDate),
    );

    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2025),
        );
        if (pickedDate != null) {
          onDateSelected(pickedDate);
          dateController.text =
              DateFormat('hh:mm a, d MMMM yyyy').format(pickedDate);
        }
      },
      child: AbsorbPointer(
        child: CustomTextField(
          label: label,
          requiredField: true,
          suffixIcon: Icons.calendar_today,
          controller: dateController,
        ),
      ),
    );
  }
}
