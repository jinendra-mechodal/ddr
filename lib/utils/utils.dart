import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../res/colors/app_color.dart';

class Utils {
  static void fieldFocusChange(BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColor.blackColor,
      textColor: AppColor.whiteColor,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static void toastMessageCenter(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColor.blackColor,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG,
      textColor: AppColor.whiteColor,
    );
  }
}

class Validation {
  static String? validatePhoneNumber(String? value) {
    // Regular expression for validating a 10-digit phone number
    final RegExp phoneRegExp = RegExp(r'^[0-9]{10}$'); // Adjust regex if needed

    // Check if the value is null or empty
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }
    // Check if the length is less than 10 digits
    else if (value.length < 10) {
      return 'Phone number must be at least 10 digits.';
    }
    // Check if the length is exactly 10 digits
    else if (value.length != 10) {
      return 'Phone number must be exactly 10 digits.';
    }
    // Check if the format matches the regex
    else if (!phoneRegExp.hasMatch(value)) {
      return 'Please enter a valid 10-digit phone number.';
    }

    return null; // Valid phone number
  }
}
