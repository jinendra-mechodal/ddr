import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/SplashScreen/view/splash_page.dart';
import 'res/routes/routes.dart';
import 'res/routes/routes_name.dart';

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
        );
      },
    );
  }
}
