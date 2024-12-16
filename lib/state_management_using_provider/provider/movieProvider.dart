import 'dart:math';
import 'package:flutter/cupertino.dart';
import '../models/movies.dart';

final List<Movies> movieList = List.generate(
    30,
    (index) => Movies(
        title: 'Movie ${index + 1}',
        time: '${Random().nextInt(100) + 60} minutes'));

class MovieProvider extends ChangeNotifier {
  final List<Movies> _movie = movieList;

  List<Movies> get movies => _movie;

  final List<Movies> _wishlistMovies = [];

  List<Movies> get movieWishlist => _wishlistMovies;

  void addToWishlist(Movies movieFromMainPage) {
    _wishlistMovies.add(movieFromMainPage);
    notifyListeners();
  }

  void removeFromWishlist(Movies removedMovie) {
    _wishlistMovies.remove(removedMovie);
    notifyListeners();
  }
}
