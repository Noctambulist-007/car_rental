import 'package:car_rental/ui/screens/summary_screen.dart';
import 'package:car_rental/ui/widgets/charge_item.dart';
import 'package:car_rental/ui/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AdditionalChargesScreen extends StatefulWidget {
  @override
  _AdditionalChargesScreenState createState() =>
      _AdditionalChargesScreenState();
}

class _AdditionalChargesScreenState extends State<AdditionalChargesScreen> {
  final List<String> chargeLabels = [
    'Collision Damage Waiver',
    'Liability Insurance',
    'Rental Tax'
  ];
  final List<double> chargeValues = [9.00, 15.00, 11.50];
  List<bool> selectedCharges = [];

  @override
  void initState() {
    super.initState();
    selectedCharges = List<bool>.filled(chargeLabels.length, false);
  }

  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.fromLTRB(22, 48.5, 22, 96),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Additional Charges',
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
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 383.2),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD7D7FF)),
                borderRadius: BorderRadius.circular(5),
                color: Color(0xFFFFFFFF),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 65.8),
                child: Column(
                  children: List.generate(chargeLabels.length, (index) {
                    return ChargeItem(
                      label: chargeLabels[index],
                      value: chargeValues[index],
                      isSelected: selectedCharges[index],
                      onChanged: (value) {
                        setState(() {
                          selectedCharges[index] = value!;
                        });
                      },
                      isPercentage: index == chargeLabels.length - 1,
                    );
                  }),
                ),
              ),
            ),
            NextButton(destination: SummaryScreen())
          ],
        ),
      ),
    );
  }
}
