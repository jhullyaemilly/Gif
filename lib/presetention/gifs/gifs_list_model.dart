import 'package:gif/data/network/domain/gif.dart';
import 'package:gif/data/repository/giphy_repository.dart';
import 'package:logger/logger.dart';

class GifsListModel {
  static const limit = 50;

  final Logger _log;
  final GiphyRepository _giphyRepo;

  const GifsListModel(this._log, this._giphyRepo);

  Future <List<Gif>> fetchGifs(int offset) async {
    try {

     // Force a network delay to see the shimmer effect
     await Future.delayed(const Duration(seconds: 5));

     return await _giphyRepo.getTrending(
      offset: offset, 
      limit: limit, 
     ); 
    } catch (e){
      _log.e('Error while obtaining trending gifs: $e');
      rethrow;
    }
  }
}