import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CorousalWidget extends StatelessWidget {
  final String? thumbnailImage;
  final String title;
  final double? rating;
  final VoidCallback onTap;

  const CorousalWidget({super.key, this.thumbnailImage, required this.title, this.rating, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Image.network(
                thumbnailImage ?? "https://upload.wikimedia.org/wikipedia/en/b/bd/Trolls3film.jpg",
                width: 0.5.sw,
                height: 0.35.sh,
                fit: BoxFit.cover,
              )),
          SizedBox(
            height: 25.h,
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 15.h, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 15.h,
          ),
          if (rating != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20.h,
                ),
                SizedBox(
                  width: 7.w,
                ),
                Text(
                  rating.toString(),
                  style: TextStyle(color: Colors.black.withOpacity(0.7)),
                )
              ],
            )
        ],
      ),
    );
  }
}
