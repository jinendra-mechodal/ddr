import 'package:flutter/material.dart';

import '../../../../res/colors/app_color.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;

  ProfileAvatar({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundImage: NetworkImage(imageUrl),
      child: FutureBuilder(
        future: precacheImage(NetworkImage(imageUrl), context),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while the image is loading
            return CircularProgressIndicator(
              color: AppColor.PrimaryColor,
            );
          } else if (snapshot.hasError) {
            // Optionally handle any errors here
            return Icon(Icons.error); // Or any other fallback widget
          } else {
            return Container(); // Return null to indicate the image is ready
          }
        },
      ),
    );
  }
}
