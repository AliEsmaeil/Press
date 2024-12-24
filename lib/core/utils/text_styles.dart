import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class TextStyles{
  static final textStyle12 = TextStyle(
    color: Colors.black,
    fontSize: 12.sp,
    fontFamily: 'TimesNewRoman',
    overflow: TextOverflow.clip,
  );
  static final textStyle14 = TextStyle(
    color: Colors.black,
    fontSize: 14.sp,
    fontFamily: 'TimesNewRoman',
    overflow: TextOverflow.clip,
  );
  static final textStyle16 = TextStyle(
    color: Colors.black,
    fontSize: 16.sp,
    fontFamily: 'TimesNewRoman',
    overflow: TextOverflow.clip,
  );
  static final textStyle18 = TextStyle(
    color: Colors.black,
    fontSize: 18.sp,
    fontFamily: 'TimesNewRoman',
    overflow: TextOverflow.clip,
  );
  static final textStyle20 = TextStyle(
    color: Colors.black,
    fontSize: 20.sp,
    fontFamily: 'TimesNewRoman',
    overflow: TextOverflow.clip,
  );
  static final textStyle22 = TextStyle(
    color: Colors.black,
    fontSize: 22.sp,
    fontFamily: 'TimesNewRoman',
    overflow: TextOverflow.clip,
  );
  static final textStyle24 = TextStyle(
    color: Colors.black,
    fontSize: 24.sp,
    fontFamily: 'TimesNewRoman',
    overflow: TextOverflow.clip,
  );
  static final textStyle26 = TextStyle(
    color: Colors.black,
    fontSize: 26.sp,
    fontFamily: 'TimesNewRoman',
    overflow: TextOverflow.clip,
  );
  static final textStyle28 = TextStyle(
    color: Colors.black,
    fontSize: 28.sp,
    fontFamily: 'TimesNewRoman',
    overflow: TextOverflow.clip,
  );
  static final textStyle30 = TextStyle(
    color: Colors.black,
    fontSize: 30.sp,
    fontFamily: 'TimesNewRoman',
    overflow: TextOverflow.clip,
  );
  static final textStyle32 = TextStyle(
    color: Colors.black,
    fontSize: 32.sp,
    fontFamily: 'TimesNewRoman',
    overflow: TextOverflow.clip,
  );

  static getStyleWith({required double fontSize, Color color = Colors.black, String fontFamily = 'TimesNewRoman' , }){
    return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
    );
  }

}