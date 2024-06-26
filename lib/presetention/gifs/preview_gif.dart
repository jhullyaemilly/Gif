import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gif/domain/gif.dart';
import 'package:gif/presetention/detail/detail_screen.dart';

class PreviewGif extends StatelessWidget {
  static const margin = 4.0;
  static const borderRadius = 4.0;

  final Gif gif;
  final bool isInLeft;
  final FavoriteChange? onFavoriteChange;

  const PreviewGif({
    required this.gif,
    required this.isInLeft,
    this.onFavoriteChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: margin,
        top: margin,
        right: isInLeft ? 0.0 : margin,
      ),
      child: GestureDetector(
        onTap: kIsWeb
            ? null
            : () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      gif: gif,
                      onFavoriteChange: onFavoriteChange,
                    ),
                  ),
                ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.network(gif.previewUrl),
          ),
        ),
      ),
    );
  }
}

class ShimmerPreviewGif extends StatelessWidget {
  final bool isInLeft;

  const ShimmerPreviewGif({required this.isInLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: PreviewGif.margin,
        top: PreviewGif.margin,
        right: isInLeft ? 0.0 : PreviewGif.margin,
      ),
      child: ClipRRect(
        borderRadius:
            const BorderRadius.all(Radius.circular(PreviewGif.borderRadius)),
        child: Container(
          color: Colors.white,
          child: const Text(''),
        ),
      ),
    );
  }
}