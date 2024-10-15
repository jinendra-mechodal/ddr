import 'package:ddr/res/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../res/components/round_button.dart';
import '../../../../res/fonts/app_fonts.dart';
import '../../../../res/routes/routes_name.dart';
import '../../../../utils/logger.dart';

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        automaticallyImplyLeading: false,
        title: Container(
          height: 60.h,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  'assets/icons/left-arrow-icon.svg',
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: Text(
                  'My Profile',
                  style: robotoMedium500.copyWith(
                      fontSize: 20.sp, color: AppColor.color6),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView( // Changed Column to ListView
          children: [
           // _buildHeader(context),
            _buildProfileSection(context),
            _buildEditProfileButton(context),
            SizedBox(height: 30.h),
            _buildDetailsSection(),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                'assets/icons/left-arrow-icon.svg',
                width: 24.w,
                height: 24.h,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: Text(
                'My Profile',
                style: robotoMedium500.copyWith(
                  fontSize: 21.sp,
                  color: AppColor.color6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 28.h,
        horizontal: 100.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                // Profile Image container
                SizedBox(
                  width: 100.w, // Adjust width as needed
                  height: 100.w, // Keep it square
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.w), // Half of width/height
                      border: Border.all(
                        color: AppColor.PrimaryColor,
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60.w), // Match border radius
                        child: Image.network(
                          'https://s3-alpha-sig.figma.com/img/98fd/774b/fc3d4fdeff74181e1e0818381ccc9c7c?Expires=1729468800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Z1yMYGSseuNqvf5fEIDHZhRyQgQ6qHN2yStBPL2jlaIqPKQV6aud9r7zfJlFPQnG~-akrxGaWaHUegzSrhrnjw2vqMiq3m6aF2Oteez1vNMu0BNOSV6lSyo7m6QtzkLELx2HQun~yNercHrD2jNeqc4w-PzyoSecL9fM0g-Q8cgrHzG2nJuU~KHBYAftdE9ExQCFVEGWKGn9p~1KjkWrZS1ILsteDczT87LO1BXo2SqBpRHGXTW~TW0dVBololRj1aWK80P9xDGmNRXmeWKa2j9oLg4EXNcYhx0Vh433w5zqz~TX0VFTK3~BsOW1gw7pRH-RxJUsVtdAwSSK5gQKiQ__',
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppColor.PrimaryColor,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: Center(child: Icon(Icons.error)),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'JHONE DOE',
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
    );
  }


  Widget _buildEditProfileButton(BuildContext context) {
    return RoundedCornerCustomButton2(
      text: 'Edit Profile',
      onPressed: () {
        Navigator.pushNamed(context, RoutesNames.myProfileEdit);
      },
      gradientColors: [
        Color(0xFF6C266E), // Start color
        Color(0xFFB34C9D), // End color
      ],
    );
  }


  // Widget _buildEditProfileButton(BuildContext context) {
  //   return RoundedCornerCustomButton(
  //     text: 'Edit Profile',
  //     onPressed: () {
  //       Navigator.pushNamed(context, RoutesNames.myProfileEdit);
  //     },
  //   );
  // }


  Widget _buildDetailsSection() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Name',
                    style: robotoSemiBold600.copyWith(
                      fontSize: 14.sp,
                      color: AppColor.color9,
                    ),
                  ),
                  Text(
                    'DCP EAST',
                    style: robotoSemiBold600.copyWith(
                      fontSize: 14.sp,
                      color: AppColor.color10,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Phone Number',
                    style: robotoSemiBold600.copyWith(
                      fontSize: 14.sp,
                      color: AppColor.color9,
                    ),
                  ),
                  Text(
                    '9807654321',
                    style: robotoSemiBold600.copyWith(
                      fontSize: 14.sp,
                      color: AppColor.color10,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'PIS',
                    style: robotoSemiBold600.copyWith(
                      fontSize: 14.sp,
                      color: AppColor.color9,
                    ),
                  ),
                  Text(
                    '21727575333',
                    style: robotoSemiBold600.copyWith(
                      fontSize: 14.sp,
                      color: AppColor.color10,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Designation',
                    style: robotoSemiBold600.copyWith(
                      fontSize: 14.sp,
                      color: AppColor.color9,
                    ),
                  ),
                  Text(
                    'ASI',
                    style: robotoSemiBold600.copyWith(
                      fontSize: 14.sp,
                      color: AppColor.color10,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'District',
                    style: robotoSemiBold600.copyWith(
                      fontSize: 14.sp,
                      color: AppColor.color9,
                    ),
                  ),
                  Text(
                    'New Delhi',
                    style: robotoSemiBold600.copyWith(
                      fontSize: 14.sp,
                      color: AppColor.color10,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Police Station',
                    style: robotoSemiBold600.copyWith(
                      fontSize: 14.sp,
                      color: AppColor.color9,
                    ),
                  ),
                  Text(
                    'New Delhi',
                    style: robotoSemiBold600.copyWith(
                      fontSize: 14.sp,
                      color: AppColor.color10,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Email',
                    style: robotoSemiBold600.copyWith(
                      fontSize: 14.sp,
                      color: AppColor.color9,
                    ),
                  ),
                  Text(
                    'name@domailn.com',
                    style: robotoSemiBold600.copyWith(
                      fontSize: 14.sp,
                      color: AppColor.color10,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Address',
                    style: robotoSemiBold600.copyWith(
                      fontSize: 14.sp,
                      color: AppColor.color9,
                    ),
                  ),
                  Text(
                    'Ahmedabad, Gujrat',
                    style: robotoSemiBold600.copyWith(
                      fontSize: 14.sp,
                      color: AppColor.color10,
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
