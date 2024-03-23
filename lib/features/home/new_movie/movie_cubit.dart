import 'package:bloc/bloc.dart';
import 'package:movies/data/movie.dart';

class MovieCubit extends Cubit<Movie?> {
  MovieCubit() : super(null);
  set(Movie movie) => emit(movie);
}
