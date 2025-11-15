import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator"), centerTitle: true),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.sp),
              ),
            ),
          ),
          SegmentedButton(
            segments: [ButtonSegment(value: false), ButtonSegment(value: true)],
            selected: {},
          ),
        ],
      ),
    );
  }
}
