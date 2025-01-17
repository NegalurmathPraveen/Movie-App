import 'package:demo_application1/src/demo_page/presentation/views/widgets/rating_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieRatingDetailsWidget extends StatelessWidget {
  final String? thumbnailImage;

  const MovieRatingDetailsWidget({super.key, this.thumbnailImage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 0.5.sh,
        child: Stack(
          children: [
            Container(
                height: 0.46.sh,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60.r))),
                child: Image.network(
                  thumbnailImage ?? "https://upload.wikimedia.org/wikipedia/en/b/bd/Trolls3film.jpg",
                  fit: BoxFit.fill,
                  height: 0.4.sh,
                  width: 1.sw,
                )),
            Positioned(
              left: 20.w,
              height: 100.h,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 0.11.sh,
                width: 0.85.sw,
                padding: EdgeInsets.only(left: 40.w, top: 10.h, bottom: 10.h, right: 5.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(-5.w, 5.w),
                        blurRadius: 10,
                        spreadRadius: 0,
                      )
                    ],
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(60.r))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RatingWidget(
                      topWidget: Icon(
                        Icons.star,
                        size: 30,
                        color: Colors.amber,
                      ),
                      title: "8.2/10",
                      subTitle: "150,212",
                    ),
                    const RatingWidget(
                        topWidget: Icon(
                          Icons.star_border_rounded,
                          size: 30,
                        ),
                        title: "Rate this"),
                    RatingWidget(
                      topWidget: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.r), color: Colors.greenAccent),
                        child: const Text(
                          "86",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: "Meta Score",
                      subTitle: "62 critic reviews",
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
