import 'package:demo_application1/src/demo_page/data/models/movies_model.dart';

import 'dart:convert';

import 'package:dio/dio.dart';

import 'movies_remote_data_source.dart';

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  @override
  Future<List<MovieModel>> getMovieList() async {
    try {
      var dio = Dio();
      var response = await dio.request(
        'https://raw.githubusercontent.com/prust/wikipedia-movie-data/master/movies.json',
        options: Options(
          method: 'GET',
        ),
      );

      if (response.statusCode == 200) {
        final List jsonData = json.decode(response.data);
        print(jsonData);
        final model = jsonData.map((e) => MovieModel.fromJson(e)).toList();
        return model;
      } else {
        throw ();
      }
    } catch (error, stackTrace) {
      print(error);
      throw ();
    }
  }
}
