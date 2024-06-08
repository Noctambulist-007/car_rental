import 'package:car_rental/controllers/reservation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'custom_text_field.dart';
import 'date_field.dart';
import 'duration_field.dart';

class ReservationForm extends StatelessWidget {
  final ReservationController reservationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 108),
      padding: const EdgeInsets.all(19),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFDFDFFF)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            label: 'Reservation ID',
            requiredField: true,
            controller: TextEditingController(),
          ),
          SizedBox(height: 20),
          Obx(() => DateField(
                label: 'Pickup Date',
                selectedDate: reservationController.pickupDate.value,
                onDateSelected: (date) =>
                    reservationController.setPickupDate(date),
              )),
          SizedBox(height: 20),
          Obx(() => DateField(
                label: 'Return Date',
                selectedDate: reservationController.returnDate.value,
                onDateSelected: (date) =>
                    reservationController.setReturnDate(date),
              )),
          SizedBox(height: 20),
          DurationField(),
          SizedBox(height: 20),
          CustomTextField(
            label: 'Discount',
            controller: TextEditingController(),
            onChanged: (String value) {
              if (value.isNotEmpty) {
                reservationController.updateDiscount(int.parse(value));
              } else {
                reservationController.updateDiscount(0);
              }
            },
          ),
        ],
      ),
    );
  }
}
