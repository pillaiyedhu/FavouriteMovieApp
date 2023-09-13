import 'dart:math';

import 'package:day9_provider_favlistapp/models/MovieModal.dart';
import 'package:flutter/material.dart';

List<MovieModal> myMovies = List.generate(50, (index) {
  return MovieModal(
      movieName: 'Movie $index',
      duration: '${Random().nextInt(100) + 60} minutes');
});

class MovieProvider extends ChangeNotifier {
  final List<MovieModal> _movies = myMovies;
  List<MovieModal> get movies => _movies;

  final List<MovieModal> _favList = [];
  List<MovieModal> get favList => _favList;

  void AddToFavourites(MovieModal movie) {
    favList.add(movie);
    notifyListeners();
  }

  void RemoveFromFavourites(MovieModal movie) {
    favList.remove(movie);
    notifyListeners();
  }
}
