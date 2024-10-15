import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/CreateNewAccount/view/page/create_account_page.dart';
import 'features/MyDutyPage/view/page/my_duty_page.dart';
import 'features/SplashScreen/view/splash_page.dart';
import 'res/routes/routes.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Design size (width, height)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'DDR',
          initialRoute: '/',
          routes: {
            '/': (context) => SplashScreen(),
            ...Routes.getRoutes(),
          },
          //home: MyDutyPage(),
        );
      },
    );
  }
}
