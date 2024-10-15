import 'package:ddr/features/EditProfilePage/view/page/edit_profile_page.dart';
import 'package:ddr/res/colors/app_color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../res/components/round_button.dart';
import '../../../../res/fonts/app_fonts.dart';
import '../../../../res/routes/routes_name.dart';
import '../widgets/dropdown_example.dart';

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

  // Define your lists here
  final List<String> policeStations = [
    'Central Police Station',
    'East Side Police Station',
    'West End Police Station',
    'North District Police Station',
  ];

  final List<String> districts = [
    'Downtown',
    'Uptown',
    'Suburban Area',
    'Rural District',
  ];

  final List<String> designations = [
    'Police Officer',
    'Sergeant',
    'Lieutenant',
    'Captain',
  ];

  String? selectedDesignation;
  String? selectedDistrict;
  String? selectedPoliceStation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),
            Text(
              'User Registration',
              style: interFont700.copyWith(
                color: Color(0xff191D23),
                fontSize: 30.5.sp,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Signing up is easy. It only takes a few steps.',
              style: interFont400.copyWith(
                color: Color(0xff6B6F72),
                fontSize: 14.5.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            _buildProfileForm(),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: RoundedCornerCustomButton(
                text: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, RoutesNames.requestUnderReview);
                },
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              'You have already Account',
              style: interFont400.copyWith(
                  fontSize: 14.5.sp, color: AppColor.color4),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesNames.login);
              },
              child: Column(
                children: [
                  Text(
                    'Login Now',
                    style: interFont600.copyWith(
                      fontSize: 16.5.sp,
                      color: AppColor.gradientEnd,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    height: 1.h,
                    width: 100.w,
                    color: AppColor.gradientEnd,
                  ),
                ],
              ),
            ),
          ],
        ),
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
          _buildDropdownField(
              label: "Select Designation",
              items: designations,
              onChanged: (value) {
                setState(() {
                  selectedDesignation = value;
                });
              },
              selectedValue: selectedDesignation),
          _buildDropdownField(
              label: "Select District",
              items: districts,
              onChanged: (value) {
                setState(() {
                  selectedDistrict = value;
                });
              },
              selectedValue: selectedDistrict),
          _buildDropdownField(
              label: "Select Police Station",
              items: policeStations,
              onChanged: (value) {
                setState(() {
                  selectedPoliceStation = value;
                });
              },
              selectedValue: selectedPoliceStation),
        ],
      ),
    );
  }

  Widget _buildTextField({required String label}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
      ),
      child: TextField(
        style: interFont600.copyWith(
          fontSize: 14.5.sp,
          color: AppColor.blackColor,
        ),
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.h, horizontal: 30.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: AppColor.color4),
          ),
          hintText: label,
          hintStyle: interFont600.copyWith(
            fontSize: 14.5.sp,
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
                  EdgeInsets.symmetric(vertical: 12.h, horizontal: 30.w),
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
          padding: EdgeInsets.only(right: 10),
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
        SizedBox(height: 5.h),
        _buildGenerateOtpButton(), // Always display this button
        SizedBox(height: 5.h),
        if (isOtpSent) _buildOtpField(),
        SizedBox(height: 5.h),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required List<String> items,
    required Function(String?) onChanged,
    String? selectedValue,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Text(
            label,
            style: interFont600.copyWith(
              fontSize: 16.sp,
              color: AppColor.color4,
            ),
          ),
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          value: selectedValue,
          onChanged: onChanged,
          buttonStyleData: const ButtonStyleData(
            height: 50,
            padding: EdgeInsets.only(left: 16, right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              border: Border(
                top: BorderSide(color: Colors.grey),
                bottom: BorderSide(color: Colors.grey),
                left: BorderSide(color: Colors.grey),
                right: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
            offset: const Offset(0, 0),
            scrollbarTheme: ScrollbarThemeData(
              thickness: MaterialStateProperty.all(6),
              thumbVisibility: MaterialStateProperty.all(true),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 48,
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildGenerateOtpButton() {
    return Column(
      children: [
        Container(
          height: 53.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(32.0),
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
              shadowColor: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            child: Text(
              'Generate OTP',
              style: interFont600.copyWith(
                color: Colors.white,
                fontSize: 16.5.sp,
              ),
            ),
          ),
        ),
        SizedBox(height: 5.h),
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
                fontSize: 14.5.sp,
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
                  fontSize: 14.5.sp,
                  color: AppColor.color4,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            height: 53.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(32.0),
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
                shadowColor: Colors.transparent,
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              child: Text(
                'Verify Mobile No',
                style: interFont600.copyWith(
                  color: Colors.white,
                  fontSize: 12.5.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
