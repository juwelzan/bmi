import 'package:bmi/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class OutputScreen extends StatelessWidget {
  OutputScreen({super.key});
  final controller = Get.put<Controller>(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            tileMode: TileMode.mirror,
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
            colors: [Color(0xff28293e), Color(0xff13131d)],
          ),
        ),
        child: Column(
          children: [
            Gap(60.h),
            SizedBox(
              width: double.infinity,
              height: 330.h,
              child: Obx(() {
                return CircularPercentIndicator(
                  circularStrokeCap: CircularStrokeCap.round,
                  header: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      controller.text!.value,
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  backgroundColor: Colors.white,
                  animation: true,
                  radius: 140.0.w,
                  lineWidth: 30.0.w,
                  progressColor: Color(int.parse(controller.color.value)),
                  percent: controller.bmi.value / 100,
                  center: Text(
                    (controller.bimout.value * 100).toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 45.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(int.parse(controller.color.value)),
                    ),
                  ),

                  animationDuration: 4000,
                  onPercentValue: (value) {
                    controller.bimout.value = value;
                  },
                );
              }),
            ),
            Gap(100.h),
            IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "home");
                controller.heightValue.value = 0.0;
                controller.weightValue.value = 0;
              },
              icon: Image.asset(
                "assets/refresh-page-option.png",
                width: 40.w,
                color: Color(0xffffffff),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
