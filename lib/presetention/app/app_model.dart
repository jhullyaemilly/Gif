import 'package:flutter/material.dart';
import 'package:gif/presetention/gifs/gifs_list.dart';
import 'package:provider/provider.dart'; // Adicione a importação correta aqui

class AppModel with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}

class MainScreen extends StatelessWidget with DesingUtils {
  @override 
  Widget build(BuildContext context) {
     return Scaffold(
            appBar: AppBar(
              title: const Text('Flutter GIFs sample'),
              actions: [
                IconButton(
                  onPressed: () {
                    final appModel =
                        Provider.of<AppModel>(context, listen: false);
                        
                    if (isLight(context)) {
                      appModel.themeMode = ThemeMode.dark;
                    } else {
                      appModel.themeMode = ThemeMode.light;
                    }
                  },
                  icon: Icon(
                    isLight(context) ? Icons.dark_mode : Icons.light_mode,
                  ),
                )
              ],
            ),
            body: const GifsList(),
    );
  }
  
  bool isLight(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }
}