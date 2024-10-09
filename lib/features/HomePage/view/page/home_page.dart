import 'package:ddr/features/LoginPage/view/page/login_page.dart';
import 'package:ddr/res/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../../../res/fonts/app_fonts.dart';
import '../widgets/SwipeActionWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25.r, // Adjust the radius as needed
              backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/men/38.jpg'), // Replace with a valid image URL
            ),
            SizedBox(width: 10), // Space between image and text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HEY Jhone Doe',
                  style: robotoMedium500.copyWith(fontSize: 19.sp),
                ),
                Text(
                  'MZ001234',
                  style: robotoRegular400.copyWith(
                      fontSize: 13.sp, color: AppColor.color4),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: AppColor.gradientEnd,
            ), // Refresh icon
            onPressed: () {
              // Add your refresh logic here
              print('Refresh button pressed');
            },
          ),
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: 18.w,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '09:15 AM',
                      style: robotoLight300.copyWith(
                        fontSize: 50.sp,
                        color: AppColor.color6, // #293646
                      ),
                    ),

                    SizedBox(
                      height: 15.h,
                    ),
                    Text('Feb 01, 2024 - Thursday'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Bordered Container 1
                  Flexible(
                    child: Container(
                      width: 182.w, // Adjust width as needed
                      height: 150.h, // Adjust height as needed
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE2E2E2)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 63,
                              height: 63,
                              decoration: BoxDecoration(
                                color: AppColor.color5,
                                borderRadius:
                                    BorderRadius.circular(20), // Set border radius
                              ),
                              child: Center(
                                child:  SvgPicture.asset(
                                  'assets/icons/myduty.svg',
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ),
                            SizedBox(height: 13.h,),
                            Text(
                              'My Duty',
                              style: robotoMedium500.copyWith(
                                  fontSize: 14.sp, color: AppColor.color3),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 21.w,
                  ),
                  Flexible(
                    child: Container(
                      width: 182.w, // Adjust width as needed
                      height: 150.h, // Adjust height as needed
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE2E2E2)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 63,
                              height: 63,
                              decoration: BoxDecoration(
                                color: AppColor.color5,
                                borderRadius:
                                BorderRadius.circular(20), // Set border radius
                              ),
                              child: Center(
                                child:  SvgPicture.asset(
                                  'assets/icons/mylevae.svg',
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ),
                            SizedBox(height: 13.h,),
                            Text(
                              'My Leave',
                              style: robotoMedium500.copyWith(
                                  fontSize: 14.sp, color: AppColor.color3),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 100.h,
            ),
            // slide to act
            SlideAction(),
          ],
        ),
      ),
    );
  }
}
