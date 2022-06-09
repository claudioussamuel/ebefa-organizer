import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateController extends GetxController {
  static DateController instance = Get.find();
  var selectedDate = DateTime.now().obs;
  var selectedStartTime = TimeOfDay.now().obs;
  var selectedEndTime = TimeOfDay.now().obs;
  @override
  void onInit() {
    chooseDate();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  chooseStartTime() async {
    TimeOfDay? pickedStartTime = await showTimePicker(
      context: Get.context!,
      initialTime: selectedStartTime.value,
    );

    if (pickedStartTime != null && pickedStartTime != selectedStartTime.value) {
      selectedStartTime.value = pickedStartTime;
    }
  }

  chooseEndTime() async {
    TimeOfDay? pickedEndTime = await showTimePicker(
      context: Get.context!,
      initialTime: selectedEndTime.value,
    );
    if (pickedEndTime != null && pickedEndTime != selectedEndTime.value) {
      selectedEndTime.value = pickedEndTime;
    }
  }
}
