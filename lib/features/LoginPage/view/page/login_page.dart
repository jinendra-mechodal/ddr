import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/login_view_model.dart';
import '../widgets/login_form.dart'; // Add provider package

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Center(
            child: Consumer<LoginViewModel>(
              builder: (context, viewModel, child) {
                return LoginForm(
                  phoneController: viewModel.phoneController,
                  errorMessage: viewModel.errorMessage, // Pass error message
                  onLoginPressed: () => viewModel.login(context), // Call login method in ViewModel
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
