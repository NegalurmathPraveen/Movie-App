import 'package:demo_application1/src/demo_page/data/models/movies_model.dart';
import 'package:demo_application1/src/demo_page/presentation/views/widgets/cast_widget.dart';
import 'package:demo_application1/src/demo_page/presentation/views/widgets/movie_rating_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/action_button.dart';
import 'widgets/title_widget.dart';

class MovieDetailsScreen extends StatefulWidget {
  final MovieModel movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieRatingDetailsWidget(
              thumbnailImage: widget.movie.thumbnail,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.verticalSpace,
                  TitleWidget(title: widget.movie.title),
                  10.verticalSpace,
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: widget.movie.genres
                          .map((name) => ActionButton(
                        buttonName: name,
                        onTap: () {},
                      ))
                          .toList(),
                    ),
                  ),
                  20.verticalSpace,
                  const Text(
                    "Plot Summary",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  10.verticalSpace,
                  const Text(
                      "American car designer Carroll Shelby and driver Kn Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order."),
                  20.verticalSpace,
                  const Text(
                    "Cast & Crew",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  10.verticalSpace,
                  SizedBox(
                    height: 0.2.sh,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.movie.cast.length,
                      itemBuilder: (context, index) {
                        return CastWidget(
                          thumbnail: widget.movie.thumbnail,
                          title: widget.movie.cast[index],
                          subTitle: "Director",
                        );
                      },
                      separatorBuilder: (context, index) => 20.horizontalSpace,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
