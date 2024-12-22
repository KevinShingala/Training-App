// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_trainings_app/src/app/home/controller/home_controller.dart';
import 'package:my_trainings_app/src/common/constant/font_helper.dart';

Future showFilterBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isDismissible: false,
    builder: (context) {
      return GetBuilder<HomeController>(builder: (controller) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                children: [
                  20.w.horizontalSpace,
                  Expanded(
                    child: Text(
                      "Filter",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: FontFamily.openSansBold,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.selectedFilter = 0;
                            controller.update();
                          },
                          child: Container(
                            height: 50.h,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                controller.selectedFilter == 0
                                    ? Container(
                                        height: 50.h,
                                        width: 10.w,
                                        color: Color(0xFFfe4855),
                                      )
                                    : SizedBox(),
                                15.w.horizontalSpace,
                                Text(
                                  "Location",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: controller.selectedFilter == 0
                                        ? FontFamily.openSansMedium
                                        : FontFamily.openSansBold,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: controller.selectedFilter == 0
                                  ? Colors.white
                                  : Colors.grey.shade300,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.selectedFilter = 1;
                            controller.update();
                          },
                          child: Container(
                            height: 50.h,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                controller.selectedFilter == 1
                                    ? Container(
                                        height: 50.h,
                                        width: 10.w,
                                        color: Color(0xFFfe4855),
                                      )
                                    : SizedBox(),
                                15.w.horizontalSpace,
                                Text(
                                  "Training Name",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: controller.selectedFilter == 1
                                        ? FontFamily.openSansMedium
                                        : FontFamily.openSansBold,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: controller.selectedFilter == 1
                                  ? Colors.white
                                  : Colors.grey.shade300,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.selectedFilter = 2;
                            controller.update();
                          },
                          child: Container(
                            height: 50.h,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                controller.selectedFilter == 2
                                    ? Container(
                                        height: 50.h,
                                        width: 10.w,
                                        color: Color(0xFFfe4855),
                                      )
                                    : SizedBox(),
                                15.w.horizontalSpace,
                                Text(
                                  "Trainer",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: controller.selectedFilter == 2
                                        ? FontFamily.openSansMedium
                                        : FontFamily.openSansBold,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: controller.selectedFilter == 2
                                  ? Colors.white
                                  : Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  20.h.verticalSpace,
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        ListView.builder(
                          itemCount: controller.fitnessList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Checkbox(
                                  value: controller.checkBoxValue(index),
                                  activeColor: Color(0xFFfe4855),
                                  onChanged: (value) {
                                    controller.filterInOut(index);
                                  },
                                ),
                                Text(
                                  controller.selectedFilter == 0
                                      ? controller.fitnessList[index].location
                                      : controller.selectedFilter == 1
                                          ? controller
                                              .fitnessList[index].trainingName
                                          : controller
                                              .fitnessList[index].trainer,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: FontFamily.openSansRegular,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        );
      });
    },
  );
}
