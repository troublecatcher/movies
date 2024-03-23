import 'package:bloc/bloc.dart';
import 'package:movies/data/movie.dart';
import 'package:movies/main.dart';

class MovieListCubit extends Cubit<List<Movie>> {
  MovieListCubit() : super([]) {
    read();
  }

  read() {
    if (movieBox!.isNotEmpty) {
      List<Movie> movieList = [];
      for (var i = 0; i < movieBox!.length; i++) {
        final movie = movieBox!.getAt(i);
        movieList.add(movie!);
      }
      emit(movieList);
    } else {
      emit([]);
    }
  }

  create(Movie movie) {
    movieBox!.add(movie).whenComplete(() => read());
  }

  update(int index, Movie movie) {
    movieBox!.put(index, movie);
    read();
  }

  delete(int index) {
    movieBox!.deleteAt(index);
    read();
  }
}
