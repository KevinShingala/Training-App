// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_trainings_app/src/app/home/controller/home_controller.dart';
import 'package:my_trainings_app/src/common/constant/font_helper.dart';

class TrainerDetailesPage extends StatelessWidget {
  int? index;
  TrainerDetailesPage({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFfe4855),
          centerTitle: true,
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            "Trainer Details",
            style: TextStyle(
              color: Colors.white,
              fontFamily: FontFamily.openSansMedium,
              fontSize: 15.sp,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              40.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80.h,
                    width: 80.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade400,
                    ),
                    child: Image.asset(
                      "assets/user.png",
                      height: 35.sp,
                      width: 35.sp,
                    ),
                  ),
                ],
              ),
              5.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.fitnessList[index ?? 0].trainer,
                    style: TextStyle(
                      fontFamily: FontFamily.openSansMedium,
                      fontSize: 15.sp,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              20.h.verticalSpace,
              DottedLine(
                direction: Axis.horizontal,
                dashColor: Colors.grey.shade300,
              ),
              20.h.verticalSpace,
              Text(
                controller.fitnessList[index ?? 0].trainingName,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: FontFamily.openSansBold,
                  fontSize: 20.sp,
                ),
              ),
              20.h.verticalSpace,
              Text(
                controller.fitnessList[index ?? 0].date,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: FontFamily.openSansBold,
                  fontSize: 15.sp,
                ),
              ),
              10.h.verticalSpace,
              Text(
                controller.fitnessList[index ?? 0].time,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: FontFamily.openSansMedium,
                  fontSize: 15.sp,
                ),
              ),
              10.h.verticalSpace,
              Text(
                "Location :   " + controller.fitnessList[index ?? 0].location,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: FontFamily.openSansMedium,
                  fontSize: 15.sp,
                ),
              ),
              10.h.verticalSpace,
              Text(
                controller.fitnessList[index ?? 0].details,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: FontFamily.openSansMedium,
                  fontSize: 15.sp,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
