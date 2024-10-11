import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ddr/res/colors/app_color.dart';
import 'package:ddr/res/fonts/app_fonts.dart';
import 'package:ddr/res/routes/routes_name.dart';

class LeaveRequest {
  final String title;
  final String startDate;
  final String endDate;
  final String status;
  final String description;

  LeaveRequest({
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.description,
  });
}

class MyLeavePage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  // Sample data
  final List<LeaveRequest> leaveRequests = List.generate(
    10,
        (index) => LeaveRequest(
      title: 'Casual Leave',
      startDate: '03/10/2024',
      endDate: '03/10/2024',
      status: ['Approved', 'Pending', 'Rejected'][index % 3],
      description:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the...',
    ),
  );

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
                  'My Leave',
                  style: robotoMedium500.copyWith(
                      fontSize: 21.sp, color: AppColor.color6),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesNames.leaveRequest);
                },
                child: Text(
                  'Apply Leave',
                  style: robotoMedium500.copyWith(
                      fontSize: 16.sp, color: AppColor.PrimaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.w),
        child: ListView.builder(
          itemCount: leaveRequests.length + 1, // 1 for the search field
          itemBuilder: (context, index) {
            if (index == 0) {
              // Search TextFormField
              return Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                child: TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/icons/bx_search-alt.svg',
                        color: Colors.grey,
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              final leaveRequest = leaveRequests[index - 1]; // Adjust index
              return Container(
                width: 405.w,
                height: 145.h,
                padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  color: Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          leaveRequest.title,
                          style: robotoSemiBold600.copyWith(
                              fontSize: 15.sp, color: AppColor.color7),
                        ),
                        Text(
                          leaveRequest.status,
                          style: robotoSemiBold600.copyWith(
                              fontSize: 15.sp,
                              color: leaveRequest.status == 'Approved'
                                  ? AppColor.color8
                                  : leaveRequest.status == 'Pending'
                                  ? Colors.orange
                                  : Colors.red),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Text(
                    //           'Start Date: ',
                    //           style: robotoRegular400.copyWith(
                    //               fontSize: 14.spMax, color: AppColor.color7),
                    //         ),
                    //         Text(
                    //           leaveRequest.startDate,
                    //           style: robotoSemiBold600.copyWith(
                    //               fontSize: 14.spMax, color: AppColor.color6),
                    //         ),
                    //       ],
                    //     ),
                    //     Row(
                    //       children: [
                    //         Text(
                    //           'End Date: ',
                    //           style: robotoRegular400.copyWith(
                    //               fontSize: 14.spMax, color: AppColor.color7),
                    //         ),
                    //         Text(
                    //           leaveRequest.endDate,
                    //           style: robotoSemiBold600.copyWith(
                    //               fontSize: 14.spMax, color: AppColor.color6),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Start Date: ',
                              style: robotoRegular400.copyWith(
                                  fontSize: 13.sp, color: AppColor.color7),
                            ),
                            Text(
                              leaveRequest.startDate,
                              style: robotoSemiBold600.copyWith(
                                  fontSize: 13.sp, color: AppColor.color6),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'End Date: ',
                              style: robotoRegular400.copyWith(
                                  fontSize: 13.sp, color: AppColor.color7),
                            ),
                            Text(
                              leaveRequest.endDate,
                              style: robotoSemiBold600.copyWith(
                                  fontSize: 13.sp, color: AppColor.color6),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      leaveRequest.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: robotoRegular400.copyWith(
                          fontSize: 13.sp, color: AppColor.color7),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
