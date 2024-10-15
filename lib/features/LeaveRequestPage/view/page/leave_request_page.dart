import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../res/components/round_button.dart';
import '../../../../res/fonts/app_fonts.dart';
import '../../../../res/routes/routes_name.dart';

class LeaveRequestPage extends StatefulWidget {
  @override
  _LeaveRequestPageState createState() => _LeaveRequestPageState();
}

class _LeaveRequestPageState extends State<LeaveRequestPage> {
  final List<String> leaveTypes = ['Sick Leave', 'Casual Leave', 'Annual Leave'];
  String? selectedLeaveType;
  DateTime? fromDate;
  DateTime? toDate;

  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();

  @override
  void dispose() {
    _fromDateController.dispose();
    _toDateController.dispose();
    super.dispose();
  }

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
                  'Leave Request',
                  style: robotoMedium500.copyWith(
                      fontSize: 21.sp, color: AppColor.color6),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   height: 60.h,
            //   width: double.infinity,
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 12.w),
            //     child: Row(
            //       children: [
            //         GestureDetector(
            //           onTap: () {
            //             Navigator.pop(context);
            //           },
            //           child: SvgPicture.asset(
            //             'assets/icons/left-arrow-icon.svg',
            //             width: 24.w,
            //             height: 24.h,
            //             color: Colors.black,
            //           ),
            //         ),
            //         SizedBox(width: 15.w),
            //         Expanded(
            //           child: Text(
            //             'Leave Request',
            //             style: robotoMedium500.copyWith(fontSize: 21.sp, color: AppColor.color6),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Color(0xFFF6F6F6), // Background color
                  //     borderRadius: BorderRadius.circular(6.r), // Match the border radius
                  //   ),
                  //   child: DropdownButtonFormField<String>(
                  //     value: selectedLeaveType,
                  //     hint: Text(
                  //       'Select Leave Type',
                  //       style: robotoSemiBold600.copyWith(fontSize: 16.sp, color: AppColor.color7),
                  //     ),
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(6.r),
                  //         borderSide: BorderSide(color: AppColor.color4),
                  //       ),
                  //       filled: true, // Ensures the background color is shown
                  //       fillColor: Colors.transparent, // Keep transparent for inner dropdown
                  //     ),
                  //     items: leaveTypes.map((String leave) {
                  //       return DropdownMenuItem<String>(
                  //         value: leave,
                  //         child: Text(leave),
                  //       );
                  //     }).toList(),
                  //     onChanged: (String? newValue) {
                  //       setState(() {
                  //         selectedLeaveType = newValue;
                  //       });
                  //     },
                  //   ),
                  // ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F6F6), // Background color
                      borderRadius: BorderRadius.circular(6.r), // Match the border radius
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Text(
                          'Select Leave Type',
                          style: robotoSemiBold600.copyWith(fontSize: 16.sp, color: AppColor.color7),
                        ),
                        items: leaveTypes.map((String leave) {
                          return DropdownMenuItem<String>(
                            value: leave,
                            child: Text(leave),
                          );
                        }).toList(),
                        value: selectedLeaveType,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedLeaveType = newValue;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 57.h,
                          padding: EdgeInsets.only(left: 0, right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)), // Match the original radius
                            border: Border(
                              top: BorderSide(color: AppColor.color4),
                              bottom: BorderSide(color: AppColor.color4),
                              left: BorderSide(color: AppColor.color4),
                              right: BorderSide(color: AppColor.color4),
                            ),
                          ),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey,
                          ),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          offset: const Offset(0, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            thickness: MaterialStateProperty.all(6),
                            thumbVisibility: MaterialStateProperty.all(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 57,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  ),


                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _buildDatePickerField(
                          context,
                          'From Date',
                          _fromDateController,
                              (DateTime? date) {
                            setState(() {
                              fromDate = date;
                              _fromDateController.text = date != null ? "${date.toLocal()}".split(' ')[0] : '';
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 23.w),
                      Expanded(
                        child: _buildDatePickerField(
                          context,
                          'To Date',
                          _toDateController,
                              (DateTime? date) {
                            setState(() {
                              toDate = date;
                              _toDateController.text = date != null ? "${date.toLocal()}".split(' ')[0] : '';
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Remark',
                      style: robotoSemiBold600.copyWith(fontSize: 16.sp, color: AppColor.color6),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 133.h,
                    margin: EdgeInsets.symmetric(vertical: 8.h),
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: TextField(
                      maxLines: 4,
                      style: robotoSemiBold600.copyWith(fontSize: 16.sp, color: AppColor.color7),
                      decoration: InputDecoration(
                        hintText: "Write here...",
                        hintStyle: robotoSemiBold600.copyWith(fontSize: 16.sp, color: AppColor.color7),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Note',
                      style: robotoSemiBold600.copyWith(fontSize: 16.sp, color: AppColor.color6),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 200.h,
                    margin: EdgeInsets.symmetric(vertical: 8.h),
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: TextField(
                      maxLines: 4,
                      style: robotoSemiBold600.copyWith(fontSize: 16.sp, color: AppColor.color7),
                      decoration: InputDecoration(
                        hintText: "Write here...",
                        hintStyle: robotoSemiBold600.copyWith(fontSize: 16.sp, color: AppColor.color7),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),

                  RoundedCornerCustomButton(
                    text: 'Submit',
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePickerField(BuildContext context, String label, TextEditingController controller, Function(DateTime?) onDateChanged) {
    return TextFormField(
      readOnly: true,
      controller: controller,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        onDateChanged(pickedDate);
      },
      style: robotoSemiBold600.copyWith(fontSize: 16.sp, color: AppColor.color7), // Text style for input
      decoration: InputDecoration(
        labelText: label,
        labelStyle: robotoSemiBold600.copyWith(fontSize: 16.sp, color: AppColor.color7), // Style for label
        suffixIcon: IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            onDateChanged(pickedDate);
          },
        ),
        filled: true, // Set filled to true
        fillColor: Color(0xFFF6F6F6), // Background color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(color: AppColor.color4),
        ),
      ),
    );
  }

}
