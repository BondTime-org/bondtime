import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
  // List to store favorited pediatricians
  final List<String> _favoritePediatricians = [];

  List<String> get favoritePediatricians => _favoritePediatricians;

  // Add/Remove Favorite
  void toggleFavorite(String name) {
    if (_favoritePediatricians.contains(name)) {
      _favoritePediatricians.remove(name);
    } else {
      _favoritePediatricians.add(name);
    }
    notifyListeners();
  }

  // Check if a pediatrician is favorited
  bool isFavorite(String name) {
    return _favoritePediatricians.contains(name);
  }
}
