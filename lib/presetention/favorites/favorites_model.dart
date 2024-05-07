import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gif/data/repository/favorite_git_repository.dart';
import 'package:gif/domain/gif.dart';
import 'package:logger/logger.dart';

class FavoritesModel extends ChangeNotifier {
  final Logger _log;
  final FavoriteGifRepository _favoritesGifRepo;

  final StreamController<List<Gif>> _favoritesController = StreamController();

  late final Stream<List<Gif>> favoritesStream;

  FavoritesModel(this._log, this._favoritesGifRepo) {
    favoritesStream = _favoritesController.stream;
  }

  @override
  void dispose() {
    _favoritesController.close();
    super.dispose();
  }

  Future<void> loadFavorites() async {
    try {
      final favorites = await _favoritesGifRepo.selectAll();
      _favoritesController.sink.add(favorites);
    } catch (e) {
      _log.e('Error while loading favorites: $e');
      _favoritesController.sink.addError(e);
    }
  }
}