import 'package:flutter/material.dart';
import 'package:gif/data/network/client/giphy_client.dart';
import 'package:gif/data/network/network.mapper.dart';
import 'package:gif/data/repository/giphy_repository.dart';
import 'package:gif/presetention/app/app.dart';
import 'package:gif/util/key.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  var providers = createProviders();

  runApp(App(providers: providers));
}

List<SingleChildWidget> createProviders(){
  final log = Logger(printer: PrettyPrinter());
  final networkMapper = NetworkMapper();
  final giphyRepo = GiphyRepository(
    client: GiphyClient(
      baseUrl: 'https://api.giphy.com/',
       apiKey: giphyApiKey,
        log: log,
        ), 
        mapper: networkMapper,
        );

        return [
          Provider<Logger>.value(value: log),
          Provider<GiphyRepository>.value(value: giphyRepo)
        ];
}