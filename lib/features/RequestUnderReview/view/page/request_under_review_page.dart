import 'package:ddr/features/LoginPage/view/page/login_page.dart';
import 'package:ddr/res/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import SVG package
import '../../../../res/components/round_button.dart';
import '../../../../res/fonts/app_fonts.dart';

class RequestUnderReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50.h),
            // SVG Image
            SvgPicture.asset(
              'assets/icons/underreview.svg', // Replace with your SVG image path
              fit: BoxFit.contain, // Adjust image fit as needed
            ),
            SizedBox(height: 50.h),

            // Text message
            Text(
              'Request Under Review',
              style: racingSansOneFont400.copyWith(fontSize: 29.sp, color: AppColor.color1),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            Text(
              'your request under review. please wait further instructions',
              style: interFont400.copyWith(fontSize: 18.sp, color: AppColor.color2),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 80.h),

            // Go Back Button
            RoundedCornerCustomButton(
              text: 'Go Back',
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
