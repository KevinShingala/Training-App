import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_trainings_app/src/app/home/presentation/pages/home_page.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) {
        return GetMaterialApp(
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
          home: HomePage(),
        );
      },
    ),
    
  
  );
}
