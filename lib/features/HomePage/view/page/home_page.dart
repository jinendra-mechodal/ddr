import 'package:ddr/features/LoginPage/view/page/login_page.dart';
import 'package:ddr/res/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../../../res/fonts/app_fonts.dart';
import '../../../../res/routes/routes_name.dart';
import '../widgets/ProfileAvatar.dart';
import '../widgets/SwipeActionWidget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // bool isFinished = false;
  //
  // Future<void> handleSlideSubmit() async {
  //   setState(() {
  //     if(isFinished == false)
  //       {
  //         isFinished = true;
  //       }
  //     else {
  //       isFinished = false;
  //     }
  //
  //   });
  // }

  bool isFinished = false;

  Future<void> handleSlideSubmit() async {
    setState(() {
      isFinished = !isFinished; // Toggle the state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      // appBar: AppBar(
      //   backgroundColor: AppColor.whiteColor,
      //   automaticallyImplyLeading: false,
      //   title: InkWell(
      //     onTap: (){
      //       Navigator.pushNamed(context, RoutesNames.myProfile);
      //     },
      //     child: Padding(
      //       padding: EdgeInsets.only(top: 20, bottom: 10,), // Top padding
      //       child: Row(
      //         children: [
      //           ProfileAvatar(
      //             imageUrl: 'https://randomuser.me/api/portraits/men/38.jpg',
      //           ),
      //           SizedBox(width: 10),
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(
      //                 'HEY JHONE DOE',
      //                 style: robotoMedium500.copyWith(
      //                   fontSize: 19.sp,
      //                   color: AppColor.color6,
      //                 ),
      //               ),
      //               Text(
      //                 'MZ001234',
      //                 style: robotoRegular400.copyWith(
      //                   fontSize: 13.sp,
      //                   color: AppColor.color4,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(
      //         Icons.refresh,
      //         color: AppColor.gradientEnd,
      //       ),
      //       onPressed: () {
      //         print('Refresh button pressed');
      //       },
      //     ),
      //   ],
      // ),

      body: SingleChildScrollView(
        // Wrap the body in SingleChildScrollView
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            SizedBox(height: 23.h),
            Container(
              color: AppColor.whiteColor,
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesNames.myProfile);
                    },
                    child: Row(
                      children: [
                        ProfileAvatar(
                          imageUrl:
                              'https://s3-alpha-sig.figma.com/img/98fd/774b/fc3d4fdeff74181e1e0818381ccc9c7c?Expires=1729468800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Z1yMYGSseuNqvf5fEIDHZhRyQgQ6qHN2yStBPL2jlaIqPKQV6aud9r7zfJlFPQnG~-akrxGaWaHUegzSrhrnjw2vqMiq3m6aF2Oteez1vNMu0BNOSV6lSyo7m6QtzkLELx2HQun~yNercHrD2jNeqc4w-PzyoSecL9fM0g-Q8cgrHzG2nJuU~KHBYAftdE9ExQCFVEGWKGn9p~1KjkWrZS1ILsteDczT87LO1BXo2SqBpRHGXTW~TW0dVBololRj1aWK80P9xDGmNRXmeWKa2j9oLg4EXNcYhx0Vh433w5zqz~TX0VFTK3~BsOW1gw7pRH-RxJUsVtdAwSSK5gQKiQ__',
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'HEY JHONE DOE',
                              style: robotoMedium500.copyWith(
                                fontSize: 19.sp,
                                color: AppColor.color6,
                              ),
                            ),
                            Text(
                              'MZ001234',
                              style: robotoRegular400.copyWith(
                                fontSize: 13.sp,
                                color: AppColor.color4,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.refresh,
                      color: AppColor.gradientEnd,
                    ),
                    onPressed: () {
                      print('Refresh button pressed');
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 50.h),
            // Reduced height
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '09:15 AM',
                    style: robotoLight300.copyWith(
                      fontSize: 50.sp,
                      color: AppColor.color6,
                    ),
                  ),
                  SizedBox(height: 10.h), // Reduced height
                  Text('Feb 01, 2024 - Thursday'),
                ],
              ),
            ),
            SizedBox(height: 50.h),
            // Reduced height
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesNames.myDuty);
                      },
                      child: Container(
                        width: 182.w,
                        height: 120.h, // Reduced height
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
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/myduty.svg',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h), // Reduced height
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
                  ),
                  SizedBox(width: 21.w),
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesNames.myLeave);
                      },
                      child: Container(
                        width: 182.w,
                        height: 120.h, // Reduced height
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
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/mylevae.svg',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h), // Reduced height
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
                  ),
                ],
              ),
            ),
            SizedBox(height: 60.h),
            // Column(
            //   children: [
            //     // Combined SlideAction for Punch In and Punch Out
            //     SlideAction(
            //       borderRadius: 50,
            //       elevation: 0,
            //       innerColor: AppColor.whiteColor,
            //       outerColor: AppColor.gradientMiddle.withOpacity(0.90),
            //       sliderButtonIcon: Padding(
            //         padding: const EdgeInsets.symmetric(vertical: 5),
            //         child: SvgPicture.asset(
            //           "assets/icons/swip-icon.svg",
            //         ),
            //       ),
            //       text: "Swipe Right to Punch In",
            //       sliderRotate: false,
            //       textStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
            //       onSubmit: () {
            //         // Punch In logic
            //       },
            //       reversed: false, // Right swipe
            //     ),
            //
            //     SizedBox(height: 20), // Spacing between actions
            //
            //     SlideAction(
            //       borderRadius: 50,
            //       //elevation: 0,
            //       innerColor: AppColor.whiteColor,
            //       outerColor: AppColor.gradientMiddle,
            //       sliderButtonIcon: Padding(
            //         padding: const EdgeInsets.symmetric(vertical: 5),
            //         child: SvgPicture.asset(
            //           "assets/icons/swip-icon.svg",
            //         ),
            //       ),
            //       text: "Swipe Left to Punch Out",
            //       sliderRotate: false,
            //       textStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
            //       onSubmit: () {
            //         // Punch Out logic
            //       },
            //       reversed: true, // Left swipe
            //     ),
            //   ],
            // ),

            // Column(
            //   children: [
            //     SizedBox(height: 10.h),
            //     buildSlideAction(
            //       text: "Swipe right to Punch in",
            //       reversed: false,
            //       onSubmit: handleSlideSubmit,
            //     ),
            //     SizedBox(height: 10.h),
            //     buildSlideAction(
            //       text: "Swipe left to Punch Out",
            //       reversed: true,
            //       onSubmit: handleSlideSubmit,
            //     ),
            //   ],
            // ),

            SizedBox(
              height: 60.h,
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: [
            //         Color(0xFF6C266E), // You can adjust this color for a smoother match
            //         Color(0xFFB34C9D), // You can adjust this color too
            //       ],
            //       begin: Alignment.centerLeft,
            //       end: Alignment.centerRight,
            //     ),
            //     borderRadius: BorderRadius.circular(50),
            //   ),
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(50),
            //     child: SlideAction(
            //       borderRadius: 50,
            //       innerColor: Colors.white,
            //       outerColor: Colors.transparent,
            //       reversed: isFinished,
            //       sliderButtonIcon: Padding(
            //         padding: const EdgeInsets.symmetric(vertical: 5),
            //         child: SvgPicture.asset(
            //           "assets/icons/swip-icon.svg", // Ensure you have this asset in your project
            //           // width: 24, // Adjust size if needed
            //           // height: 24,
            //         ),
            //       ),
            //       text: "Swipe right to Punch in", // Custom text
            //       textStyle: TextStyle(
            //         color: Colors.white,
            //         fontSize: 16, // Adjust font size
            //       ),
            //       sliderRotate: false,
            //       onSubmit: handleSlideSubmit, // Your callback function
            //     ),
            //   ),
            // ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isFinished
                      ? [
                          Color(0xFFB34C9D),
                          Color(0xFF6C266E)
                        ] // Colors when punched out
                      : [Color(0xFF6C266E), Color(0xFFB34C9D)],
                  // Colors when punched in
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                // child: SlideAction(
                //   borderRadius: 50,
                //   innerColor: Colors.white,
                //   outerColor: Colors.transparent,
                //   reversed: isFinished,
                //   sliderButtonIcon: Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 5),
                //     child: SvgPicture.asset(
                //       "assets/icons/swip-icon.svg", // Ensure you have this asset in your project
                //     ),
                //   ),
                //   text: isFinished ? "Swipe Left to Punch Out  " : "Swipe Right to Punch In ", // Conditional text
                //   textStyle: TextStyle(
                //     color: Colors.white,
                //     fontSize: 16, // Adjust font size
                //   ),
                //   sliderRotate: false,
                //   onSubmit: handleSlideSubmit, // Your callback function
                // ),

                child: SlideAction(
                  borderRadius: 50,
                  innerColor: Colors.white,
                  outerColor: Colors.transparent,
                  reversed: isFinished,
                  sliderButtonIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: SvgPicture.asset(
                      "assets/icons/swip-icon.svg", // Ensure you have this asset in your project
                    ),
                  ),
                  // text: isFinished
                  //     ? "Swipe Left to Punch Out  "
                  //     : "Swipe Right to Punch In ",
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16, // Adjust font size
                  ),
                  sliderRotate: false,
                  onSubmit: handleSlideSubmit,
                  // Your callback function
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SvgPicture.asset(
                      //   isFinished
                      //       ? "assets/icons/right-arrowsmall-icon.svg" // Icon for Punch Out
                      //       : "assets/icons/lrft-arrow-small-icon.svg" , // Icon for Punch In // Ensure this asset is in your project
                      //   width: 24, // Adjust size as needed
                      //   height: 24, // Adjust size as needed
                      // ),
                      // SizedBox(width: 8), // Space between icon and text
                      // Text(
                      //
                      //
                      //   // style: TextStyle(
                      //   //   color: Colors.white,
                      //   //   fontSize: 16, // Adjust font size
                      //   // ),
                      // ),
                      isFinished
                          ? Row(
                              children: [
                                SvgPicture.asset(
                                  // lrft-arrow-small-icon.svg
                                  "assets/icons/right-arrowsmall-icon.svg",
                                  // Icon for Punch Out
                                  width: 8,
                                  height: 10,
                                ),
                                SizedBox(
                                    width: 8), // Space between icon and text
                                Text(
                                  "Swipe Left to Punch Out",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                Text(
                                  "Swipe Right to Punch In",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                    width: 8), // Space between text and icon
                                SvgPicture.asset(
                                  "assets/icons/lrft-arrow-small-icon.svg",
                                  // Icon for Punch In
                                  width: 8,
                                  height: 10,
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80.h,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/punch-in-icon.svg",
                        height: 36.h,
                        width: 32.w,
                      ),
                      Text(
                        "09:08 AM",
                        style: robotoSemiBold600.copyWith(
                          color: AppColor.color6,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        "Punch In",
                        style: robotoRegular400.copyWith(
                          color: AppColor.color7,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Container(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/punch-out-icon.svg",
                        height: 36.h,
                        width: 32.w,
                      ),
                      Text(
                        "06:05 PM",
                        style: robotoSemiBold600.copyWith(
                          color: AppColor.color6,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        "Punch Out",
                        style: robotoRegular400.copyWith(
                          color: AppColor.color7,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Container(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/total-icon.svg",
                        height: 36.h,
                        width: 32.w,
                      ),
                      Text(
                        "08:13 ",
                        style: robotoSemiBold600.copyWith(
                          color: AppColor.color6,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        "Total Hours",
                        style: robotoRegular400.copyWith(
                          color: AppColor.color7,
                          fontSize: 12.sp,
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
    );
  }
}
