// ignore_for_file: camel_case_types, unused_field

import 'package:get/get.dart';

enum HeightType { cm, feet }

enum Weight { kg, pound }

class Controller extends GetxController {
  Rx<HeightType> height = HeightType.feet.obs;
  Rx<Weight> weight = Weight.kg.obs;
  Rx<double> heightValue = 0.0.obs;
  RxInt weightValue = 0.obs;
  RxDouble bmi = 0.0.obs;
  RxDouble bimout = 0.0.obs;
  RxString? text = "".obs;
  RxString color = "0xff001BB7".obs;

  void bimAns() {
    double m = heightValue.value * 0.0254;
    bmi.value = weightValue.value / (m * m);

    if (bmi.value < 18.5) {
      text = "Underweight".obs;
      color.value = "0xff001BB7";
    } else if (bmi.value >= 18.5 && bmi.value < 24.9) {
      color.value = "0xff08CB00";
      text = "Normal weight".obs;
    } else if (bmi.value >= 25 && bmi.value < 29.9) {
      color.value = "0xffFF6C0C";
      text = "Overweight".obs;
    } else {
      color.value = "0xffDC0E0E";
      text = "Obesity".obs;
    }
  }
}
