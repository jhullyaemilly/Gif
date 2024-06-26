import 'package:gif/data/database/entity/favorite_gif_entity.dart';
import 'package:gif/data/network/network_mapper.dart';
import 'package:gif/domain/gif.dart';

class DatabaseMapper {
  Gif toGif(FavoriteGifEntity entity) {
    try {
      return Gif(
        id: entity.id,
        title: entity.title,
        previewUrl: entity.previewUrl,
        url: entity.url,
        displayName: entity.displayName,
        username: entity.username,
        userProfileUrl: entity.userProfileUrl,
      );
    } catch (e) {
      throw MapperException<FavoriteGifEntity, Gif>(e.toString());
    }
  }

  List<Gif> toGifs(List<FavoriteGifEntity> entities) {
    final List<Gif> list = [];

    for (final entity in entities) {
      list.add(toGif(entity));
    }

    return list;
  }

  FavoriteGifEntity toFavoriteGif(Gif model) {
    try {
      final date = DateTime.now();

      return FavoriteGifEntity(
        id: model.id,
        title: model.title,
        previewUrl: model.previewUrl,
        url: model.url,
        timestamp: date.millisecondsSinceEpoch,
        displayName: model.displayName,
        username: model.username,
        userProfileUrl: model.userProfileUrl,
      );
    } catch (e) {
      throw MapperException<Gif, FavoriteGifEntity>(e.toString());
    }
  }
}