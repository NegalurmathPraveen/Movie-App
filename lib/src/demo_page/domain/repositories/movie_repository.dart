import 'package:dartz/dartz.dart';

import '../../../../core/models/error_model.dart';
import '../../data/models/movies_model.dart';


abstract class MovieRepository {
  Future<Either<Failure, List<MovieModel>>> getMovieList();
}