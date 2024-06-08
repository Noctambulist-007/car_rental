import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.w400)),
        Spacer(),
        Text(value, style: TextStyle(fontWeight: FontWeight.w400)),
      ],
    );
  }
}
