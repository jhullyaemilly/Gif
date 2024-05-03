import 'dart:convert';

import 'package:gif/data.network.entity/response.entity.dart';
import 'package:gif/data.network/client/base.client.dart';
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
      'api_key': apiKey,
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
