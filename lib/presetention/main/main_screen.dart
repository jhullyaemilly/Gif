import 'package:flutter/material.dart';
import 'package:gif/presetention/gifs/gifs_list.dart';

class MainScreen extends StatelessWidget with DesingUtils {
  @override 
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: const Text('Flutter GIFs sample'),
      ),
      body: const GifsList(),
    );
  }
}