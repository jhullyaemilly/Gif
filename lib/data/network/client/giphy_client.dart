import 'dart:convert';
import '../entity/response_entity.dart';
import 'base_client.dart';
import 'package:logger/logger.dart';

class GiphyClient extends BaseClient {
  final String baseUrl;
  final String apiKey;

  GiphyClient({
    required this.baseUrl,
    required this.apiKey,
    required Logger log,
  }) : super(log: log);

  Future<ResponseEntity> getTrending({int? limit, int? offset}) async {
    final params = {
      '1CZ9g3mracgvaeuxrRcTU78YW9b5MSwS': apiKey,
    };

    if (limit != null) {
      params['limit'] = limit.toString();
    }

    if (offset != null) {
      params['offset'] = offset.toString();
    }
    //Do request
    final response =
        await get('${baseUrl}vl/gifs/trending', queryParameters: params);

    // Check the result
    checkKo(response, 'get_trending', body: params.toString());

    //Serialize result and return
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return ResponseEntity.fromJson(json);
  }
}
