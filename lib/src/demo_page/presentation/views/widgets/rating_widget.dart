import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingWidget extends StatelessWidget {
  final Widget topWidget;
  final String title;
  final String subTitle;

  const RatingWidget({super.key, required this.topWidget, required this.title, this.subTitle = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        topWidget,
        Padding(
          padding: EdgeInsets.only(top: 3.h, bottom: 2.h),
          child: Text(
            title,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 12),
          ),
        ),
        Text(
          subTitle,
          style: TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 10),
        )
      ],
    );
  }
}
