import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_application1/src/demo_page/presentation/views/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/init_app.dart';
import '../bloc/movie_bloc.dart';
import 'widgets/action_button.dart';
import 'widgets/corousal_widget.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> with TickerProviderStateMixin {
  final bloc = getIt<MovieBloc>();
  final _pageController = PageController(initialPage: 0);
  final ValueNotifier<int> _selectedIndexNotifier = ValueNotifier(0);
  List<String> tabList = ["In Theatre", "Box Office", "Comedy"];
  List<String> actionButtons = ["Action", "Crime", "Comedy", "Drama"];

  @override
  void initState() {
    bloc.add(GetMovieListEvent());
    _pageController.addListener(() {
      int nextIndex = _pageController.page!.round();
      if (nextIndex != _selectedIndexNotifier.value) {
        _selectedIndexNotifier.value = nextIndex;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.verticalSpace,
            SizedBox(
              height: 45.h,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                scrollDirection: Axis.horizontal,
                itemCount: tabList.length,
                itemBuilder: (context, index) {
                  return ValueListenableBuilder(
                      valueListenable: _selectedIndexNotifier,
                      builder: (context, value, _) {
                        return GestureDetector(
                          onTap: () {
                            _selectedIndexNotifier.value = index;
                            _pageController.jumpToPage(index); // Jump to selected page
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              tabList[index],
                              style: TextStyle(
                                  color: _selectedIndexNotifier.value == index ? Colors.black : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32),
                            ),
                          ),
                        );
                      });
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 15.w,
                  );
                },
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 15.h, left: 20.w),
                height: 5.h,
                width: 35.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.w),
                  color: Colors.pink.withOpacity(0.6),
                )),
            50.verticalSpace,
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                children: actionButtons
                    .map((name) => ActionButton(
                          buttonName: name,
                          onTap: () {},
                        ))
                    .toList(),
              ),
            ),
            50.verticalSpace,
            Expanded(
              child: BlocBuilder<MovieBloc, MovieState>(
                bloc: bloc,
                builder: (context, state) {
                  if (state is MovieListLoadedState) {
                    return CarouselSlider.builder(
                      itemCount: state.movieList.length,
                      itemBuilder: (context, index, realIndex) {
                        return CorousalWidget(
                          title: state.movieList[index].title,
                          thumbnailImage: state.movieList[index].thumbnail,
                          rating: 8.2,
                          onTap: () {
                            // always pushing with the first item because it has most of the details required for second screen
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => MovieDetailsScreen(movie: state.movieList.first)));
                          },
                        );
                      },
                      options: CarouselOptions(
                        height: 0.7.sh,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        scrollDirection: Axis.horizontal,
                        viewportFraction: 0.6,
                      ),
                    );
                  } else if (state is MovieListLoadingState) {
                    return Center(
                      child: SizedBox.square(dimension: 50.h, child: const CircularProgressIndicator()),
                    );
                  } else if (state is MovieListFailedState) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red, fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            )
          ],
        ));
  }
}
