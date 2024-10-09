import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../res/components/round_button.dart';
import '../../../../res/fonts/app_fonts.dart';
import '../../../../res/routes/routes_name.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController phoneController;
  final String? errorMessage;
  final VoidCallback onLoginPressed;

  const LoginForm({
    super.key,
    required this.phoneController,
    required this.errorMessage,
    required this.onLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20.h),
          Image.asset(
            'assets/images/login-logo.png',
            width: 250.w,
            height: 166.73.h,
          ),
          SizedBox(height: 20.h),
          Text(
            'Daily Duty Roster',
            style: racingSansOneFont400.copyWith(fontSize: 35.sp, color: AppColor.color1),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          Text(
            'Welcome back to the app. Verify your Phone Number',
            style: interFont400.copyWith(fontSize: 18.sp, color: AppColor.color2),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 100.h),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Phone Number',
              style: interFont400.copyWith(fontSize: 18.sp, color: AppColor.color2),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 12.h),

          // Phone number input
          TextField(
            controller: phoneController,
            decoration: InputDecoration(
              labelStyle: const TextStyle(color: AppColor.color2),
              hintText: 'phone number',
              hintStyle: interFont600.copyWith(color: AppColor.color4.withOpacity(0.6)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: const BorderSide(color: AppColor.color2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: const BorderSide(color: AppColor.color2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: const BorderSide(color: AppColor.color1),
              ),
              errorText: errorMessage, // Show error message if exists
              contentPadding: EdgeInsets.only(left: 30.w, top: 15.h, bottom: 15.h),
            ),
            style: interFont600.copyWith(color: AppColor.color4),
            keyboardType: TextInputType.phone,
            maxLength: 10,
          ),


          SizedBox(height: 50.h),
          // Container(
          //   height: 53.h,
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     gradient: AppColor.linearGradient,
          //     borderRadius: BorderRadius.circular(32.r),
          //   ),
          //   child: ElevatedButton(
          //     onPressed: onLoginPressed,
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: Colors.transparent,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(35.r),
          //       ),
          //     ),
          //     child: Text(
          //       'Generate OTP',
          //       style: interFont600.copyWith(
          //         color: Colors.white,
          //         fontSize: 18.sp,
          //       ),
          //     ),
          //   ),
          // ),

          RoundedCornerCustomButton(
            text: 'Generate OTP',
            onPressed: onLoginPressed,
          ),

          SizedBox(height: 42.h),
          Text(
            'If You are New User ',
            style: interFont400.copyWith(fontSize: 16.sp, color: AppColor.color4),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),

          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesNames.requestUnderReview);
            },
            child: Column(
              children: [
                Text(
                  'Create New Account',
                  style: interFont600.copyWith(
                    fontSize: 18.sp,
                    color: AppColor.gradientEnd,

                  ),
                  textAlign: TextAlign.center,
                ),


                Container(
                  height: 1.h, // Thickness of the underline
                  width: 195.w, // Adjust width as needed
                  color: AppColor.gradientEnd, // Underline color
                ),
              ],
            ),
          ),

          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
