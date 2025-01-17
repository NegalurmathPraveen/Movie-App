import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CastWidget extends StatelessWidget {
  final String? thumbnail;
  final String title;
  final String subTitle;

  const CastWidget({super.key, this.thumbnail, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.2.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 35.r,
            backgroundImage: NetworkImage(thumbnail ?? "https://upload.wikimedia.org/wikipedia/en/b/bd/Trolls3film.jpg"),
          ),
          7.verticalSpace,
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          2.verticalSpace,
          Text(
            subTitle,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
