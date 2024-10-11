import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../res/components/round_button.dart';
import '../../../../res/fonts/app_fonts.dart';
import '../../../../res/routes/routes_name.dart';

class MyProfileEditPage extends StatefulWidget {
  @override
  _MyProfileEditPageState createState() => _MyProfileEditPageState();
}

class _MyProfileEditPageState extends State<MyProfileEditPage> {
  String phoneNumber = '';

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
                  'Edit Profile',
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
        child: ListView(
          children: [
            _buildProfileSection(context),
            _buildProfileForm(),

            SizedBox(height: 40.h,),
            RoundedCornerCustomButton(
              text: 'Submit',
              onPressed: (){
                //Navigator.pushNamed(context, RoutesNames.requestUnderReview);
                Navigator.pop(context);                 },
            ),
            SizedBox(height: 20.h),
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
              alignment: Alignment.center, // Center the icon within the Stack
              children: [
                SizedBox(
                  width: 100.w,
                  height: 100.w,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60.w),
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
                              child: Center(
                                child: Icon(
                                  Icons.error,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 39, // Adjust this value to position the icon vertically
                  child: SvgPicture.asset(
                    'assets/icons/chnage-icon.svg',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  // Widget _buildProfileSection(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(
  //       vertical: 28.h,
  //       horizontal: 100.w,
  //     ),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Center(
  //           child: Stack(
  //             children: [
  //               SizedBox(
  //                 width: 100.w,
  //                 height: 100.w,
  //                 child: Container(
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(2),
  //                     child: ClipRRect(
  //                       borderRadius: BorderRadius.circular(60.w),
  //                       child: Image.network(
  //                         'https://s3-alpha-sig.figma.com/img/98fd/774b/fc3d4fdeff74181e1e0818381ccc9c7c?Expires=1729468800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Z1yMYGSseuNqvf5fEIDHZhRyQgQ6qHN2yStBPL2jlaIqPKQV6aud9r7zfJlFPQnG~-akrxGaWaHUegzSrhrnjw2vqMiq3m6aF2Oteez1vNMu0BNOSV6lSyo7m6QtzkLELx2HQun~yNercHrD2jNeqc4w-PzyoSecL9fM0g-Q8cgrHzG2nJuU~KHBYAftdE9ExQCFVEGWKGn9p~1KjkWrZS1ILsteDczT87LO1BXo2SqBpRHGXTW~TW0dVBololRj1aWK80P9xDGmNRXmeWKa2j9oLg4EXNcYhx0Vh433w5zqz~TX0VFTK3~BsOW1gw7pRH-RxJUsVtdAwSSK5gQKiQ__',
  //                         fit: BoxFit.cover,
  //                         loadingBuilder: (context, child, loadingProgress) {
  //                           if (loadingProgress == null) return child;
  //                           return Center(
  //                             child: CircularProgressIndicator(
  //                               color: AppColor.PrimaryColor,
  //                             ),
  //                           );
  //                         },
  //                         errorBuilder: (context, error, stackTrace) {
  //                           return Container(
  //                             color: Colors.grey[300],
  //                             child: Center(child: Icon(Icons.error)),
  //                           );
  //                         },
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         SizedBox(height: 20.h),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildProfileForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField(label: "Jhone Doe"), // Name field
        _buildTextField(label: "PIS"), // PIS field
        _buildTextFieldWithCounter(label: "9807654321"), // Contact field with counter
        _buildDropdownField(label: "ASI"), // Dropdown for ASI
        _buildDropdownField(label: "New Delhi"), // Dropdown for City
        _buildDropdownField(label: "New Delhi Police Station"), // Dropdown for Station
        _buildTextField(label: "name@domain.com"), // Email field
        _buildTextField(label: "Ahmedabad, Gujrat"), // Address field
      ],
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
          contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: AppColor.color4,
            ),
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
              contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  color: AppColor.color4,
                ),
              ),
              hintText: label,
              hintStyle: interFont600.copyWith(
                fontSize: 16.sp,
                color: AppColor.color4,
              ),
            ),
          ),
        ),
        // Display phone number count
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

      ],
    );
  }

  Widget _buildDropdownField({required String label}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: AppColor.color6,
            ),
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
}
