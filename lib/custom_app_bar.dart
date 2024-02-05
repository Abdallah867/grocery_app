import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar customAppBar(String name) {
  return AppBar(
    scrolledUnderElevation: 0,
    centerTitle: true,
    title: Text(
      name,
      style: TextStyle(fontSize: 20.0.sp, fontWeight: FontWeight.w900),
    ),
  );
}
