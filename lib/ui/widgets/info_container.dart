import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  final List<Widget> children;

  const InfoContainer({
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 13, 40),
      padding: EdgeInsets.fromLTRB(7, 7, 7.4, 7),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFD7D7FF)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(children: children),
    );
  }
}
