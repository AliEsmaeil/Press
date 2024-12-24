import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Spacers on num{

  SizedBox get verticalSpacer=>SizedBox(height: this.h,);
  SizedBox get horizontalSpacer=>SizedBox(width: this.w,);
}