import 'package:ddr/features/EditProfilePage/view/page/edit_profile_page.dart';
import 'package:ddr/res/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../res/components/round_button.dart';
import '../../../../res/fonts/app_fonts.dart';
import '../../../../res/routes/routes_name.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  String phoneNumber = '';
  String otp = '';
  bool isOtpSent = false;
  List<Color> gradientColors = [Color(0xff6C266E), Color(0xffB34C9D)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.h),
        //  SizedBox(height: 30.h),
          Text(
            'User Registration',
            style: interFont700.copyWith(
              color: Color(0xff191D23),
              fontSize: 32.sp,
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'Signing up is easy. It only takes a few steps.',
              style: interFont400.copyWith(
                color: Color(0xff6B6F72),
                fontSize: 16.spMin,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 40.h),
          _buildProfileForm(),
          SizedBox(height: 20.h),

          Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: RoundedCornerCustomButton(
              text: 'Register',
              onPressed: (){
                Navigator.pushNamed(context, RoutesNames.requestUnderReview);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(label: "Enter your Name"),
          _buildTextField(label: "Enter PIS"),
          _buildTextFieldWithCounter(label: "Phone number"),
          _buildDropdownField(label: "Select Designation"),
          _buildDropdownField(label: "Select District"),
          _buildDropdownField(label: "Select Police Station"),
        ],
      ),
    );
  }

  Widget _buildTextField({required String label}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: TextField(
        style: interFont600.copyWith(
          fontSize: 16.sp,
          color: AppColor.blackColor,
        ),
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: AppColor.color4),
          ),
          hintText: label,
          hintStyle: interFont600.copyWith(
            fontSize: 16.sp,
            color: AppColor.color4,
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldWithCounter({required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: TextField(
            keyboardType: TextInputType.phone,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
            onChanged: (value) {
              setState(() {
                phoneNumber = value;
              });
            },
            style: interFont600.copyWith(
              fontSize: 16.sp,
              color: AppColor.color6,
            ),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: AppColor.blackColor),
              ),
              hintText: label,
              hintStyle: interFont600.copyWith(
                fontSize: 16.sp,
                color: AppColor.color4,
              ),
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(
            right: 10,
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${phoneNumber.length}/10',
              style: interFont600.copyWith(
                fontSize: 16.sp,
                color: AppColor.color4,
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        if (!isOtpSent) _buildGenerateOtpButton(),
        SizedBox(height: 10,),
        if (isOtpSent) _buildOtpField(),
      ],
    );
  }

  Widget _buildDropdownField({required String label}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: AppColor.color6),
          ),
        ),
        hint: Text(
          label,
          style: interFont600.copyWith(
            fontSize: 16.sp,
            color: AppColor.color4,
          ),
        ),
        items: ['Option 1', 'Option 2', 'Option 3'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (newValue) {
          // Handle dropdown change
        },
      ),
    );
  }

  Widget _buildGenerateOtpButton() {
    return Column(
      children: [
        Container(
          height: 53, // Keep this height, but consider using MediaQuery
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(32.0), // Rounded corners
          ),
          child: ElevatedButton(
            onPressed: () {
              if (phoneNumber.length == 10) {
                setState(() {
                  isOtpSent = true;
                });
                print("OTP sent to $phoneNumber");
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please enter a valid phone number.')),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              // No background color as gradient is applied
              shadowColor: Colors.transparent,
              // Remove button shadow
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
              // Adjusted padding
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(32.0), // Same radius as Container
              ),
            ),
            child: Text(
              'Generate OTP',
              style: interFont600.copyWith(
                color: Colors.white,
                fontSize: 18.sp,
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
      ],
    );
  }

  Widget _buildOtpField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              keyboardType: TextInputType.number,
              maxLength: 6,
              onChanged: (value) {
                setState(() {
                  otp = value;
                });
              },
              style: interFont600.copyWith(
                fontSize: 16.sp,
                color: AppColor.color6,
              ),
              decoration: InputDecoration(
                counterText: '',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: AppColor.color4),
                ),
                hintText: 'Enter OTP',
                hintStyle: interFont600.copyWith(
                  fontSize: 16.sp,
                  color: AppColor.color4,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            height: 53, // Keep this height, but consider using MediaQuery
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(32.0), // Rounded corners
            ),
            child: ElevatedButton(
              onPressed: () {
                if (otp.length == 6) {
                  print("Verifying OTP: $otp");
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a valid OTP.')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                // No background color as gradient is applied
                shadowColor: Colors.transparent,
                // Remove button shadow
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
                // Adjusted padding
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(32.0), // Same radius as Container
                ),
              ),
              child: Text(
                'Verify Mobile No',
                style: interFont600.copyWith(
                  color: Colors.white,
                  fontSize: 18.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
