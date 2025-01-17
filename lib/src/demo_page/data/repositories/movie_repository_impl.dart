import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/models/error_model.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/movies_remote_data_source.dart';
import '../models/movies_model.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MoviesRemoteDataSource _dataSource;

  MovieRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<MovieModel>>> getMovieList() async {
    try {
      final response = await _dataSource.getMovieList();
      return Right(response);
    } on DioException catch (error, stackTrace) {
      return Left(Failure(statusCode: error.response?.statusCode ?? 401, message: error.message ?? "unauthorized"));
    }
  }
}
