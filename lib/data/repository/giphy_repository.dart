import 'package:gif/data/network/client/giphy_client.dart';
import 'package:gif/data/network/network_mapper.dart';
import 'package:gif/domain/gif.dart';

class GiphyRepository {
  final GiphyClient client;
  final NetworkMapper mapper;

  GiphyRepository({
    required this.client,
    required this.mapper,
  });

  Future<List<Gif>> getTrending({int? limit, int? offset}) async {
    final response = await client.getTrending(
      limit: limit,
      offset: offset,
    );
    return mapper.toGifs(response.data);
  }
}