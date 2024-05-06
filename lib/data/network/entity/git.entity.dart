import 'package:gif/data/network/entity/images.entity.dart';
import 'package:gif/data/network/entity/user.entity.dart';

class GifEntity {
  final String id;
  final String url;
  final String title;
  final ImagesEntity images;
  final UserEntity? user;

  GifEntity({
    required this.id,
    required this.url,
    required this.title,
    required this.images,
    this.user,
  });

  factory GifEntity.fromJson(Map<String, dynamic> json){
    return GifEntity(
    id: json['id'] as String, 
    url: json ['url'] as String, 
    title: json['title'] as String, 
    images: ImagesEntity.fromJson(json['images'] as Map<String, dynamic>),
    user: json.containsKey('user') 
        ? UserEntity.fromJson(json['user']as Map<String, dynamic>) 
        : null,
  );
  }
}
