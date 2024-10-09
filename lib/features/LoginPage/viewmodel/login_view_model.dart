import 'package:flutter/material.dart';
import '../../../utils/utils.dart';
import '../../../../res/routes/routes_name.dart'; // Ensure this import is present

class LoginViewModel extends ChangeNotifier {
  final TextEditingController phoneController = TextEditingController();
  String? errorMessage;

  LoginViewModel() {
    // Add listener to the phone controller to validate on every change
    phoneController.addListener(_validatePhoneNumber);
  }

  void _validatePhoneNumber() {
    String? phoneNumber = phoneController.text;
    // Validate the phone number
    errorMessage = Validation.validatePhoneNumber(phoneNumber);
    notifyListeners(); // Notify UI to update with the error message
  }

  void login(BuildContext context) { // Pass context as a parameter
    String? phoneNumber = phoneController.text;

    // Validate the phone number one last time when login is pressed
    errorMessage = Validation.validatePhoneNumber(phoneNumber);

    if (errorMessage == null) {
      // Proceed with login logic
      debugPrint('Login successful. Phone Number: $phoneNumber');

      // Navigate to the home page
      Navigator.pushNamed(context, RoutesNames.home); // Use context here
    } else {
      debugPrint('Validation Error: $errorMessage');
      notifyListeners(); // Notify UI to update with the error message
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}
