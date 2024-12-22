// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_trainings_app/src/app/home/controller/home_controller.dart';
import 'package:my_trainings_app/src/app/home/presentation/pages/trainer_details_page.dart';
import 'package:my_trainings_app/src/app/home/presentation/widgets/fitness_widget.dart';
import 'package:my_trainings_app/src/common/constant/font_helper.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // Configure system UI settings
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: const Color(0xFFfe4855),
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (_) {
          return SafeArea(
            child: Column(
              children: [
                // Header Section
                buildHeaderSection(context),

                // Vertical spacing
                5.h.verticalSpace,

                // Fitness List Section
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.fitnessList.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      var fitness = controller.fitnessList[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            TrainerDetailesPage(index: index),
                          );
                        },
                        child: FitnessWidget(
                          fitness: fitness,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Builds the header section
  Widget buildHeaderSection(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            buildTopBanner(),
            buildFilterSection(),
          ],
        ),
        buildImageCarousel(),
      ],
    );
  }

  // Builds the top banner
  Widget buildTopBanner() {
    return Container(
      height: 250.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(color: const Color(0xFFfe4855)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.h.verticalSpace,
          Row(
            children: [
              Expanded(
                child: Text(
                  "Trainings",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: FontFamily.openSansBold,
                    fontSize: 30.sp,
                  ),
                ),
              ),
              Icon(Icons.menu, color: Colors.white),
            ],
          ),
          60.h.verticalSpace,
          Text(
            "Highlights",
            style: TextStyle(
              color: Colors.white,
              fontFamily: FontFamily.openSansBold,
              fontSize: 20.sp,
            ),
          ),
        ],
      ),
    );
  }

  // Builds the filter section
  Widget buildFilterSection() {
    return Container(
      height: 150.h,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              controller.filterData(Get.context!);
            },
            child: Container(
              height: 35.h,
              width: 78.w,
              padding: EdgeInsets.symmetric(horizontal: 8.sp),
              margin: EdgeInsets.only(left: 10.sp),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.sp),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  controller.isFilter
                      ? Icon(Icons.close, color: Colors.grey, size: 17.sp)
                      : Image.asset(
                          "assets/filter.png",
                          height: 15.h,
                          width: 15.w,
                          color: Colors.grey,
                        ),
                  5.w.horizontalSpace,
                  Text(
                    controller.isFilter ? "Clear" : "Filter",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: FontFamily.openSansMedium,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          20.h.verticalSpace,
        ],
      ),
    );
  }

  // Builds the image carousel
  Widget buildImageCarousel() {
    return Positioned(
      bottom: 80.h,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 160.h,
        child: Stack(
          children: [
            // Carousel
            SizedBox(
              height: 160.h,
              width: double.infinity,
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.imageList.length,
                scrollDirection: Axis.horizontal,
                onPageChanged: controller.onSwipeToChangeCurrentIndex,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 40.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.sp),
                      image: DecorationImage(
                        image: AssetImage(controller.imageList[index]),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            // Left Arrow
            buildCarouselArrow(
              position: Alignment.centerLeft,
              onTap: controller.decrementIndex,
              icon: Icons.arrow_back_ios_new_rounded,
            ),
            // Right Arrow
            buildCarouselArrow(
              position: Alignment.centerRight,
              onTap: controller.incrementIndex,
              icon: Icons.arrow_forward_ios_rounded,
            ),
          ],
        ),
      ),
    );
  }

  // Builds a carousel arrow
  Widget buildCarouselArrow({
    required Alignment position,
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return Align(
      alignment: position,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 80.h,
          width: 30.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(4.sp),
          ),
          child: Icon(icon, size: 20.sp, color: Colors.white),
        ),
      ),
    );
  }
}
