import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gif/data/database/dao/favorite_gif_dao.dart';
import 'package:gif/data/database/database_mapper.dart';
import 'package:gif/data/network/client/giphy_client.dart';
import 'package:gif/data/network/network_mapper.dart';
import 'package:gif/data/repository/favorite_git_repository.dart';
import 'package:gif/data/repository/giphy_repository.dart';
import 'package:gif/presetention/app/app.dart';
import 'package:gif/presetention/app/app_model.dart';
import 'package:gif/util/key.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final providers = createProviders();

  // ignore: deprecated_member_use
  Sqflite.devSetDebugModeOn(kDebugMode);

  runApp(
    App(providers: providers),
  );
}

List<SingleChildWidget> createProviders() {
  // Util
  final log = Logger(printer: PrettyPrinter());

  // Data
  final networkMapper = NetworkMapper();

  final giphyRepo = GiphyRepository(
    client: GiphyClient(
      baseUrl: 'https://api.giphy.com/',
      apiKey: giphyApiKey,
      log: log,
    ),
    mapper: networkMapper,
  );

  final favoriteGifDao = FavoriteGifDao();
  final databaseMapper = DatabaseMapper();
  final favoriteGifRepository = FavoriteGifRepository(
    dao: favoriteGifDao,
    mapper: databaseMapper,
  );

  // Create list of providers
  return [
    Provider<Logger>.value(value: log),
    Provider<GiphyRepository>.value(value: giphyRepo),
    Provider<FavoriteGifRepository>.value(value: favoriteGifRepository),
    ChangeNotifierProvider<AppModel>(
      create: (context) => AppModel(),
    ),
  ];
}
