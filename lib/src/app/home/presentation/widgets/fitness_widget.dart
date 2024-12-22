// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_trainings_app/src/app/home/model/fitness_info.dart';
import 'package:my_trainings_app/src/common/constant/font_helper.dart';

class FitnessWidget extends StatelessWidget {
  final Fitness? fitness;

  FitnessWidget({super.key, this.fitness});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            offset: const Offset(3.0, 3.0),
            blurRadius: 5.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Row(
        children: [
          10.w.horizontalSpace,
          SizedBox(
            width: 130.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.h.verticalSpace,
                Text(
                  fitness?.date ?? "",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: FontFamily.openSansBold,
                    fontSize: 14.sp,
                  ),
                ),
                10.h.verticalSpace,
                Text(
                  fitness?.time ?? "",
                  style: TextStyle(
                    color: Colors.black54,
                    fontFamily: FontFamily.openSansMedium,
                    fontSize: 12.sp,
                  ),
                ),
                Spacer(),
                Text(
                  fitness?.location ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: FontFamily.openSansRegular,
                    fontSize: 14.sp,
                  ),
                ),
                10.h.verticalSpace,
              ],
            ),
          ),
          10.w.horizontalSpace,
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.sp),
            child: DottedLine(
              direction: Axis.vertical,
              dashColor: Colors.grey.shade300,
            ),
          ),
          10.w.horizontalSpace,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.h.verticalSpace,
                Text(
                  "Filling Fast!",
                  style: TextStyle(
                    color: Color(0xFFfe4855),
                    fontFamily: FontFamily.openSansBold,
                    fontSize: 13.sp,
                  ),
                ),
                5.h.verticalSpace,
                Text(
                  fitness?.trainingName ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: FontFamily.openSansBold,
                    fontSize: 15.sp,
                  ),
                ),
                10.h.verticalSpace,
                Row(
                  children: [
                    Container(
                      height: 45.h,
                      width: 45.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade400,
                      ),
                      child: Image.asset(
                        "assets/user.png",
                        height: 25.h,
                        width: 25.w,
                      ),
                    ),
                    8.w.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            fitness?.trainer ?? "",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: FontFamily.openSansMedium,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            fitness?.details ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: FontFamily.openSansRegular,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
