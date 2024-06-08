import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReservationController extends GetxController {
  final reservationId = ''.obs;
  var pickupDate = DateTime.now().obs;
  var returnDate = DateTime.now().obs;
  var duration = 0.obs;
  var discount = 0.obs;
  var selectedCharges = <String>[].obs;

  static ReservationController get to => Get.find();

  void setPickupDate(DateTime date) {
    pickupDate.value = date;
    updateDuration();
  }

  void setReturnDate(DateTime date) {
    returnDate.value = date;
    updateDuration();
  }

  void updateDuration() {
    duration.value = returnDate.value.difference(pickupDate.value).inDays;
  }

  void updateReservationId(String value) {
    reservationId.value = value;
  }

  void updateDiscount(int value) {
    discount.value = value;
  }

  String getFormattedDate(DateTime date) {
    final DateFormat formatter = DateFormat('hh:mm a, d MMMM yyyy');
    return formatter.format(date);
  }
}
