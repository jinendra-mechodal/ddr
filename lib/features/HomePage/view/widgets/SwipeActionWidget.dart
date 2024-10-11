// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:slide_to_act/slide_to_act.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../../../../res/colors/app_color.dart';
//
// class SlideActionWidget extends StatelessWidget {
//   final Function(String) onSubmit;
//   final bool reversed;
//   final String text;
//   final String? svgIconPath;
//   final TextStyle? textStyle;
//   final EdgeInsetsGeometry? padding;
//   final BoxDecoration? decoration;
//
//   const SlideActionWidget({
//     Key? key,
//     required this.onSubmit,
//     this.reversed = false,
//     required this.text,
//     this.svgIconPath,
//     this.textStyle,
//     this.padding,
//     this.decoration,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<SlideActionState> _key = GlobalKey();
//
//     // Define the custom text style
//     final TextStyle robotoMedium500 = TextStyle(
//       fontFamily: 'Roboto',
//       fontWeight: FontWeight.w500,
//       fontSize: 16.sp,
//       color: AppColor.whiteColor,
//     );
//
//     return Padding(
//       padding: padding ?? const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: decoration ?? BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: SlideAction(
//           key: _key,
//           borderRadius: 50,
//           elevation: 0,
//           innerColor: AppColor.whiteColor,
//           outerColor: AppColor.gradientMiddle,
//           sliderButtonIcon: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5),
//             child: svgIconPath != null
//                 ? SvgPicture.asset(
//               svgIconPath!,
//               alignment: reversed ? Alignment.centerRight : Alignment.centerLeft,
//             )
//                 : Container(), // Fallback if no icon is provided
//           ),
//           text: '', // Set to an empty string to use the Text widget below
//           sliderRotate: false,
//           textStyle: textStyle ?? robotoMedium500,
//           onSubmit: () {
//             String direction = reversed ? 'left to right' : 'right to left';
//             onSubmit(direction);
//
//             Future.delayed(
//               Duration(seconds: 1),
//                   () => _key.currentState!.reset(),
//             );
//           },
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Center(
//               child: Text(
//                 text,
//                 style: textStyle ?? robotoMedium500,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class HomePageSwipeActionWidget extends StatelessWidget {
//   final List<Map<String, dynamic>> actions;
//
//   const HomePageSwipeActionWidget({
//     Key? key,
//     required this.actions,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(height: 50),
//         ...actions.map((action) {
//           return SlideActionWidget(
//             onSubmit: action['onSubmit'] ?? (direction) => print(direction),
//             text: action['text'] ?? 'Slide Action',
//             reversed: action['reversed'] ?? false,
//             svgIconPath: action['svgIconPath'],
//             textStyle: action['textStyle'],
//             padding: action['padding'],
//             decoration: action['decoration'],
//           );
//         }).toList(),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../res/colors/app_color.dart';

class SlideActionWidget extends StatelessWidget {
  final Function(String) onSubmit;
  final bool reversed;
  final String text;
  final String? svgIconPath;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? decoration;

  const SlideActionWidget({
    Key? key,
    required this.onSubmit,
    this.reversed = false,
    required this.text,
    this.svgIconPath,
    this.textStyle,
    this.padding,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<SlideActionState> _key = GlobalKey();

    // Define the custom text style
    final TextStyle robotoMedium500 = TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
      color: AppColor.whiteColor,
    );

    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0),
      child: Container(
        decoration: decoration ?? BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: SlideAction(
          key: _key,
          borderRadius: 50,
          elevation: 0,
          innerColor: AppColor.whiteColor,
          outerColor: AppColor.gradientMiddle.withOpacity(0.90),
          sliderButtonIcon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: svgIconPath != null
                ? SvgPicture.asset(
              svgIconPath!,
              alignment: reversed ? Alignment.centerRight : Alignment.centerLeft,
            )
                : Container(),
          ),
          text: '', // Set to an empty string to use the Text widget below
          sliderRotate: false,
          textStyle: textStyle ?? robotoMedium500,
          onSubmit: () {
            String direction = reversed ? 'Punch Out' : 'Punch In';
            onSubmit(direction);

            Future.delayed(
              Duration(seconds: 1),
                  () => _key.currentState!.reset(),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Text(
                text,
                style: textStyle ?? robotoMedium500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePageSwipeActionWidget extends StatelessWidget {
  final List<Map<String, dynamic>> actions;

  const HomePageSwipeActionWidget({
    Key? key,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        ...actions.map((action) {
          return SlideActionWidget(
            onSubmit: action['onSubmit'] ?? (direction) => print(direction),
            text: action['text'] ?? 'Slide Action',
            reversed: action['reversed'] ?? false,
            svgIconPath: action['svgIconPath'],
            textStyle: action['textStyle'],
            padding: action['padding'],
            decoration: action['decoration'],
          );
        }).toList(),
      ],
    );
  }
}
