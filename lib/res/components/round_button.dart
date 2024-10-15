import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_color.dart';
import '../fonts/app_fonts.dart';

class RoundedCornerCustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double borderRadius;

  const RoundedCornerCustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height = 53.0,
    this.borderRadius = 32.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: AppColor.linearGradient,
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
        ),
        child: Text(
          text,
          style: interFont600.copyWith(
            color: Colors.white,
            fontSize: 16.5.sp,
          ),
        ),
      ),
    );
  }
}

class RoundedCornerCustomButton2 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final List<Color> gradientColors;
  final double height;

  RoundedCornerCustomButton2({
    required this.text,
    required this.onPressed,
    required this.gradientColors,
    this.height = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(30.0), // Rounded corners
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // No background color as gradient is applied
          shadowColor: Colors.transparent, // Remove button shadow
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0), // Same radius as Container
          ),
        ),
        child:Text(
          text,
          style: interFont600.copyWith(
            color: Colors.white,
            fontSize: 16.5.sp,
          ),
        ),
      ),
    );
  }
}
