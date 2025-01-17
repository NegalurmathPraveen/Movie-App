import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/movies_model.dart';

part 'movies_remote_data_source.g.dart';

@RestApi(baseUrl: "https://raw.githubusercontent.com")
abstract class MoviesRemoteDataSource {
  factory MoviesRemoteDataSource(Dio dio, {String? baseUrl}) = _MoviesRemoteDataSource;

  @GET("/prust/wikipedia-movie-data/master/movies.json")
  Future<List<MovieModel>> getMovieList();
}
