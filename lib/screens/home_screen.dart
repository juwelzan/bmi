// ignore_for_file: unnecessary_string_interpolations, unrelated_type_equality_checks

import 'package:bmi/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:wheel_slider/wheel_slider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put<Controller>(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            tileMode: TileMode.mirror,
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
            colors: [Color(0xff28293e), Color(0xff13131d)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 450.h,
              right: 150.w,
              child: Container(
                height: 300.h,
                width: 300.w,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.w, color: Color(0xff25344f)),
                ),
              ),
            ),
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Row(
                children: [
                  ///kg input fill
                  Obx(() {
                    return SizedBox(
                      width: 240.w,
                      height: 400.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (controller.weight == Weight.pound) ...[
                            Text(
                              "${(controller.weightValue.value * 2.20462).toStringAsFixed(0)} Pound",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ] else ...[
                            Text(
                              "${(controller.weightValue.value).toStringAsFixed(0)} KG",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],

                          Gap(10),
                          Image.asset(
                            "assets/weighing.png",
                            width: 100.w,
                            color: Color(0xff08CB00),
                          ),
                          SizedBox(
                            width: 280.w,

                            child: Padding(
                              padding: EdgeInsets.all(8.0.sp),
                              child: WheelSlider(
                                lineColor: Colors.white,
                                pointerColor: Colors.amber,
                                totalCount: 320,
                                initValue: 0,
                                onValueChanged: (value) {
                                  controller.weightValue.value = value;
                                },
                              ),
                            ),
                          ),
                          SegmentedButton<Weight>(
                            showSelectedIcon: false,

                            segments: [
                              ButtonSegment<Weight>(
                                label: Text("KG"),
                                value: Weight.kg,
                              ),
                              ButtonSegment<Weight>(
                                label: Text("Pound"),
                                value: Weight.pound,
                              ),
                            ],
                            selected: {controller.weight.value},
                            onSelectionChanged: (value) {
                              controller.weight.value = value.first;
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateColor.resolveWith((
                                state,
                              ) {
                                if (state.contains(WidgetState.selected)) {
                                  return Color(0xff08CB00);
                                }
                                return Colors.white;
                              }),
                              foregroundColor: WidgetStateColor.resolveWith((
                                state,
                              ) {
                                if (state.contains(WidgetState.selected)) {
                                  return Colors.white;
                                } else {
                                  return Colors.black;
                                }
                              }),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  Container(
                    height: 400.h,
                    width: 110.w,
                    decoration: BoxDecoration(
                      color: Color(0xff181725),
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                    child: Obx(() {
                      return Padding(
                        padding: EdgeInsets.all(8.0.sp),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/height.png",
                              width: 40.sp,
                              color: Color(0xff08CB00),
                            ),
                            Gap(6.h),
                            if (controller.height == HeightType.cm) ...[
                              Text(
                                "${(controller.heightValue.value * 2.54).toStringAsFixed(1)} CM",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ] else ...[
                              Text(
                                "${controller.heightValue.value ~/ 12}:${(controller.heightValue.value % 12).toStringAsFixed(0)} Feet",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                            SizedBox(
                              height: 290.h,
                              child: SfSlider.vertical(
                                activeColor: Color(0xff28458c),
                                inactiveColor: Color(0xff511D43),
                                max: 120,
                                min: 0,

                                showTicks: true,
                                interval: 20,
                                showLabels: true,

                                value: controller.heightValue.value,
                                onChanged: (value) {
                                  controller.heightValue.value = value;
                                },
                              ),
                            ),

                            SegmentedButton<HeightType>(
                              showSelectedIcon: false,
                              segments: [
                                ButtonSegment<HeightType>(
                                  value: HeightType.cm,
                                  label: Text("CM"),
                                ),
                                ButtonSegment<HeightType>(
                                  value: HeightType.feet,
                                  label: Text("FT"),
                                ),
                              ],
                              selected: {controller.height.value},
                              onSelectionChanged: (value) {
                                controller.height.value = value.first;
                              },
                              style: ButtonStyle(
                                backgroundColor: WidgetStateColor.resolveWith((
                                  state,
                                ) {
                                  if (state.contains(WidgetState.selected)) {
                                    return Color(0xff08CB00);
                                  }
                                  return Colors.white;
                                }),
                                foregroundColor: WidgetStateColor.resolveWith((
                                  state,
                                ) {
                                  if (state.contains(WidgetState.selected)) {
                                    return Colors.white;
                                  } else {
                                    return Colors.black;
                                  }
                                }),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 30.h,
              left: 140.w,
              right: 140.w,
              child: IconButton(
                onPressed: () {
                  if (controller.heightValue.value >= 1.0 &&
                      controller.weightValue.value >= 1.0) {
                    controller.bimAns();
                    Navigator.pushNamed(context, "/output");
                  }
                },
                icon: Image.asset("assets/bmi (1).png", width: 60.sp),
              ),
            ),
            Positioned(
              top: 70.h,
              left: 50.w,
              child: Text(
                "BMI Calculator",
                style: TextStyle(
                  fontSize: 30.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
