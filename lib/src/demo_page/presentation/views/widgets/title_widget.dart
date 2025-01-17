import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
              ),
              5.verticalSpace,
              Text(
                "2019   PG-13   2h 32min",
                style: TextStyle(color: Colors.black.withOpacity(0.7)),
              )
            ],
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 55.w,
              height: double.maxFinite,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r), color: Colors.pinkAccent.withOpacity(0.6)),
              child: const Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
