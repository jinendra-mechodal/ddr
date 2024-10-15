import 'package:ddr/res/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

class MyDutyPage extends StatefulWidget {
  @override
  _MyDutyPageState createState() => _MyDutyPageState();
}

class _MyDutyPageState extends State<MyDutyPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  // Map<DateTime, List<String>> _events = {
  //   DateTime(2024, 12, 6): ['Rebury Investigation'],
  //   // Add other events here...
  //   DateTime(2024, 10, 12): ['Dusshera'],
  //   DateTime(2024, 11, 1): ['Diwali'],
  //   DateTime(2024, 12, 6): ['Rebury Investigation'],
  //   DateTime(2024, 12, 13): ['Some Other Event'],
  //   DateTime(2024, 1, 15): ['Makar Sankranti or Pongal'],
  //   DateTime(2024, 1, 26): ['Thaipusam'],
  //   DateTime(2024, 2, 14): ['Vasant Panchami'],
  //   DateTime(2024, 3, 8): ['Maha Shivaratri'],
  //   DateTime(2024, 3, 20): ['Hindi New Year'],
  //   DateTime(2024, 3, 24): ['Holika Dahan'],
  //   DateTime(2024, 3, 25): ['Holi'],
  //   DateTime(2024, 4, 9): ['Ugadi or Gudi Padwa or Telugu New Year'],
  //   DateTime(2024, 4, 13): ['Vaisakhi or Baisakhi or Vishu'],
  //   DateTime(2024, 4, 14): ['Tamil New Year'],
  //   DateTime(2024, 4, 15): ['Bengali New Year or Bihu'],
  //   DateTime(2024, 4, 17): ['Ramanavami'],
  //   DateTime(2024, 4, 23): ['Hanuman Jayanti'],
  //   DateTime(2024, 4, 10): ['Akshaya Tritiya'],
  //   DateTime(2024, 4, 6): ['Savitri Pooja'],
  //   DateTime(2024, 7, 7): ['Puri Rath Yatra'],
  //   DateTime(2024, 7, 21): ['Guru Purnima'],
  //   DateTime(2024, 8, 9): ['Nag Panchami'],
  //   DateTime(2024, 8, 16): ['Varalakshmi Vratam'],
  //   DateTime(2024, 8, 19): ['Raksha Bandhan'],
  //   DateTime(2024, 8, 26): ['Krishna Janmashtami'],
  //   DateTime(2024, 9, 7): ['Ganesh Chaturthi'],
  //   DateTime(2024, 9, 16): ['Vishwakarma Puja'],
  //   DateTime(2024, 10, 2): ['Mahalaya Amavasya'],
  //   DateTime(2024, 10, 3): ['Navaratri begins'],
  //   DateTime(2024, 10, 11): ['Navaratri ends or Maha Navami'],
  //   DateTime(2024, 10, 12): ['Dusshera'],
  //   DateTime(2024, 10, 16): ['Sharad Purnima'],
  //   DateTime(2024, 10, 20): ['Karwa Chauthi'],
  //   DateTime(2024, 10, 29): ['Dhan Teras'],
  //   DateTime(2024, 11, 1): ['Diwali'],
  //   DateTime(2024, 11, 3): ['Bhai Dooj'],
  //   DateTime(2024, 11, 7): ['Chhath Puja'],
  //   DateTime(2024, 11, 15): ['Kartik Poornima'],
  //   DateTime(2024, 12, 11): ['Geeta Jayanti'],
  //   DateTime(2024, 12, 15): ['Dhanu Sankranti'],
  // };

  @override
  void initState() {
    super.initState();
    //_loadEvents();
    _selectedDay = _focusedDay; // Set selected day to today initially
  }

  // List<String> _getEventsForMonth(DateTime month) {
  //   List<String> eventsForMonth = [];
  //   _events.forEach((date, events) {
  //     if (date.year == month.year && date.month == month.month) {
  //       eventsForMonth.addAll(events);
  //     }
  //   });
  //   return eventsForMonth;
  // }

  // List<String> _getEventsForToday() {
  //   DateTime normalizedDay = DateTime(day.year, day.month, day.day);
  //   return _events[normalizedDay] ?? [];
  //   //return _events[DateTime.now()] ?? [];
  // }

  // List<String> _getEventsForToday() {
  //   DateTime today = DateTime.now();
  //   DateTime normalizedDay = DateTime(today.year, today.month, today.day);
  //   return _events[normalizedDay] ?? [];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
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
                  'My Duty',
                  style: TextStyle(
                      fontSize: 21.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: TableCalendar(
                focusedDay: _focusedDay,
                firstDay: DateTime.utc(2000, 1, 1),
                lastDay: DateTime.utc(2050, 12, 31),
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onPageChanged: (focusedDay) {
                  setState(() {
                    _focusedDay = focusedDay;
                    _selectedDay =
                        focusedDay; // Set selected day to focused day
                  });
                },
               // eventLoader: (day) => _getEventsForDay(day),
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                     color: Color(0xffB34C9D),
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  todayTextStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekendStyle: TextStyle(color: Color(0xffB34C9D)),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            // Event List
            // _selectedDay != null
            //     ? ListView.builder(
            //   shrinkWrap: true, // Allows the ListView to take only the space it needs
            //   physics: NeverScrollableScrollPhysics(), // Disable scrolling of the ListView
            //   itemCount: _getEventsForToday().isNotEmpty
            //       ? _getEventsForToday().length
            //       : _getEventsForMonth(_focusedDay).length,
            //   itemBuilder: (context, index) {
            //     String event = _getEventsForToday().isNotEmpty
            //         ? _getEventsForToday()[index]
            //         : _getEventsForMonth(_focusedDay)[index];
            //     return _eventCard(DateTime.now(), event); // Pass today's date or focused day
            //   },
            // )
            //     : Center(
            //   child: Text(
            //     "No Events",
            //     style: TextStyle(fontSize: 16.sp, color: Colors.grey),
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Today',
                  style: interFont400.copyWith(
                    fontSize: 16,
                    color: Color(0xff6A7D94),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Color(0xffB34C9D),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "06",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'TUE', // Use eventDate for day name
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rebury Investigation',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 1),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Color(0xffB34C9D),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "06",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'TUE', // Use eventDate for day name
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rebury Investigation',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Dec 07, 2024 ',
                  style: interFont400.copyWith(
                    fontSize: 16,
                    color: Color(0xff6A7D94),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Color(0xffB34C9D),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "06",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'TUE', // Use eventDate for day name
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rebury Investigation',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 1),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Color(0xffB34C9D),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "06",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'TUE', // Use eventDate for day name
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rebury Investigation',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 1),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Color(0xffB34C9D),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "06",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'TUE', // Use eventDate for day name
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rebury Investigation',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 1),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Color(0xffB34C9D),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "06",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'TUE', // Use eventDate for day name
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rebury Investigation',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // List<String> _getEventsForDay(DateTime day) {
  //   // return _events[day] ?? [];
  //   // Normalize the date by resetting the time to midnight
  //   //DateTime normalizedDay = DateTime(day.year, day.month, day.day);
  //   DateTime normalizedDay = DateTime(day.year, day.month, day.day);
  //   return _events[normalizedDay] ?? [];
  // }

  String _getDayName(DateTime day) {
    return ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"][day.weekday % 7];
  }

  // Widget _eventCard(String event) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
  //     margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
  //     decoration: BoxDecoration(
  //       color: Colors.grey.shade100,
  //       borderRadius: BorderRadius.circular(12.r),
  //     ),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Container(
  //           padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
  //           decoration: BoxDecoration(
  //             color: Colors.purple,
  //             borderRadius: BorderRadius.circular(8.r),
  //           ),
  //           child: Column(
  //             children: [
  //               Text(
  //                 "${_selectedDay!.day.toString().padLeft(2, '0')}",
  //                 style: TextStyle(
  //                     fontSize: 16.sp,
  //                     fontWeight: FontWeight.w700,
  //                     color: Colors.white),
  //               ),
  //               Text(
  //                 _getDayName(_selectedDay!),
  //                 style: TextStyle(
  //                     fontSize: 12.sp,
  //                     fontWeight: FontWeight.w500,
  //                     color: Colors.white),
  //               ),
  //             ],
  //           ),
  //         ),
  //         SizedBox(width: 12.w),
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 event,
  //                 style: TextStyle(
  //                     fontSize: 16.sp, fontWeight: FontWeight.w600),
  //               ),
  //               SizedBox(height: 4.h),
  //               Text(
  //                 "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  //                 style: TextStyle(
  //                   fontSize: 12.sp,
  //                   color: Colors.grey,
  //                 ),
  //                 maxLines: 2,
  //                 overflow: TextOverflow.ellipsis,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

// Update _eventCard to accept the date and event as parameters
  Widget _eventCard(DateTime eventDate, String event) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              children: [
                Text(
                  "${eventDate.day}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  _getDayName(eventDate), // Use eventDate for day name
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4.h),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
