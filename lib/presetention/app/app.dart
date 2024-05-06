import 'package:flutter/material.dart';
import 'package:gif/presetention/main/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class App extends StatelessWidget {
  final List<SingleChildWidget> providers;

  const App({required this.providers});

  @override 
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'GIFs',
        home: MainScreen(),
      ),
      );
  }
}