import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../res/components/round_button.dart';
import '../../../../res/fonts/app_fonts.dart';
import '../../../../res/routes/routes_name.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController phoneController;
  final String? errorMessage;
  final VoidCallback? onLoginPressed;

  const LoginForm({
    super.key,
    required this.phoneController,
    required this.errorMessage,
    this.onLoginPressed,
  });

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isOtpSent = false;
  bool isOtpVerified = false; // Track OTP verification
  String otp = '';
  List<Color> gradientColors = [Color(0xff6C266E), Color(0xffB34C9D)];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 63.h),
          Image.asset(
            'assets/images/login-logo.png',
            width: 250.w,
            height: 166.h,
          ),
          Text(
            'Daily Duty Roster',
            style: racingSansOneFont400.copyWith(fontSize: 26.sp, color: AppColor.color1),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          Text(
            'Welcome back to the app. Verify your Phone Number',
            style: interFont400.copyWith(fontSize: 16.5.sp, color: AppColor.color2),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 100.h),
          _buildPhoneNumberInput(),
          SizedBox(height: 20.h),
          _buildOtpAndLoginButtons(),
          SizedBox(height: 42.h),
          _buildNewUserText(),
          SizedBox(height: 20.h),
          _buildCreateAccountLink(context),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }

  Widget _buildPhoneNumberInput() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Phone Number',
            style: interFont400.copyWith(fontSize: 16.5.sp, color: AppColor.color2),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: 12.h),
        TextField(
          controller: widget.phoneController,
          decoration: InputDecoration(
            labelStyle: const TextStyle(color: AppColor.color2),
            hintText: 'Phone number',
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
            errorText: widget.errorMessage,
            contentPadding: EdgeInsets.only(left: 30.w, top: 15.h, bottom: 15.h),
            counterText: '',
          ),
          style: interFont600.copyWith(color: AppColor.color4),
          keyboardType: TextInputType.phone,
          maxLength: 10,
        ),
        Padding(
          padding: EdgeInsets.only(right: 12.w,top: 10.h),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${widget.phoneController.text.length}/10',
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

  Widget _buildOtpAndLoginButtons() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (!isOtpSent)
              Expanded(
                child: RoundedCornerCustomButton(
                  text: 'Generate OTP',
                  onPressed: () {
                    setState(() {
                      isOtpSent = true; // Simulate OTP sent
                    });
                  },
                ),
              ),
            if (isOtpSent) ...[
              Expanded(
                flex: 3, // Allocate more space to the OTP input
                child: Padding(
                  padding: EdgeInsets.only(right: 10.w), // Ensure spacing
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        otp = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter OTP',
                      hintStyle: interFont600.copyWith(color: AppColor.color4.withOpacity(0.6)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: AppColor.color2, width: 2), // Border color and width
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: AppColor.color2, width: 2), // Enabled border color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: AppColor.color1, width: 2), // Focused border color
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h), // Adjust padding for better touch target
                      counterText: '',
                    ),
                    style: interFont600.copyWith(color: AppColor.color4),
                    keyboardType: TextInputType.number,
                    maxLength: 6,

                  ),
                ),
              ),
              SizedBox(width: 10.w), // Add space between the input and the button
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
                      setState(() {
                        isOtpVerified = true; // Set OTP as verified
                      });
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
          ],
        ),
        if (isOtpVerified) // Show the login button after OTP verification
          Padding(
            padding: EdgeInsets.only(top: 30.h), // Add some spacing above the button
            child: RoundedCornerCustomButton(
              text: 'Login',
              onPressed: () {
                if (widget.onLoginPressed != null) {
                  widget.onLoginPressed!(); // Call the login callback
                }
                print("Logging in with phone number: ${widget.phoneController.text}");
              },
            ),
          ),
      ],
    );
  }

  Widget _buildNewUserText() {
    return Text(
      'If You are New User ',
      style: interFont400.copyWith(fontSize: 14.5.sp, color: AppColor.color4),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildCreateAccountLink(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesNames.createAccount);
      },
      child: Column(
        children: [
          Text(
            'Create New Account',
            style: interFont600.copyWith(
              fontSize: 16.5.sp,
              color: AppColor.gradientEnd,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            height: 1.h,
            width: 195.w,
            color: AppColor.gradientEnd,
          ),
        ],
      ),
    );
  }
}
