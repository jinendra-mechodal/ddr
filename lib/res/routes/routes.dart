// routes.dart
import 'package:flutter/material.dart';

import '../../features/CreateNewAccount/view/page/create_account_page.dart';
import '../../features/EditProfilePage/view/page/edit_profile_page.dart';
import '../../features/HomePage/view/page/home_page.dart';
import '../../features/LeaveRequestPage/view/page/leave_request_page.dart';
import '../../features/LoginPage/view/page/login_page.dart';
import '../../features/MyDutyPage/view/page/my_duty_page.dart';
import '../../features/MyLeavePage/view/page/my_leave_page.dart';
import '../../features/MyProfilePage/view/page/my_profile_page.dart';
import '../../features/RequestUnderReview/view/page/request_under_review_page.dart';
import 'routes_name.dart';


class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      RoutesNames.login: (context) => LoginPage(),
      RoutesNames.createAccount: (context) => CreateAccountPage(),
      RoutesNames.requestUnderReview: (context) => RequestUnderReviewPage(),
      RoutesNames.home: (context) => HomePage(),
      RoutesNames.myDuty: (context) => MyDutyPage(),
      RoutesNames.myLeave: (context) => MyLeavePage(),
      RoutesNames.leaveRequest: (context) => LeaveRequestPage(),
      RoutesNames.myProfile: (context) => MyProfilePage(),
      RoutesNames.myProfileEdit: (context) => MyProfileEditPage(),
    };
  }
}
