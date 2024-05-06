
import 'package:flutter/material.dart';
import 'package:gif/data/network/domain/gif.dart';
import 'package:gif/presetention/gifs/gifs_list.dart';
import 'package:gif/util/values.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget with DesingUtils{
  final Gif gif;

  const DetailScreen({required this.gif});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GIF'),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: marginLate,
              top: 30.0,
              right: marginLate,
              bottom: 30.0,
           ),
           child: Text(
            gif.title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
           ),
          ),
          _Gif(gif: gif),
          if (gif.displayName != null)
           Container(
            padding: const EdgeInsets.only(
              right: marginLate,
            ),
            child: _CreatedBy(
              name: gif.displayName!,
              profileUrl: gif.userProfileUrl,
              ),
            ),
           Container(
            padding: const EdgeInsets.only(
              left: marginLate,
              top: marginVertLarge,
              right: marginLate,
              bottom: marginVert,
            ),
            child: Center(
                    child: SizedBox(
                      height: 20.0,
                      width: double.infinity,
                      child: Image.asset(
                        isLight(context)
                            ? 'assets/assets/images/img_giphy_light.png'
                            : 'assets/assets/images/img_giphy_dark.png',
                      ),  
              ),
            )
           )
        ],
      ),
    );
  }
  
  bool isLight(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }

}
 
class _Gif extends StatelessWidget with DesingUtils {
  static const _size = 300.0;

  final Gif gif;

  const _Gif({required this.gif});

  @override 
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: marginLate,
        top: marginVert,
        right: marginLate,
        bottom: marginVert,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(stdBorderRadius)),
        child: Image.network(gif.url,
        loadingBuilder:  (context, widget, loadingProcess) {
          if (loadingProcess == null) {
            return widget;
          } else {
            return Shimmer.fromColors(
              baseColor: isLight(context)
                 ?shimmerBaseColor
                 :shimmerBaseColorDark,
              highlightColor: isLight(context)
                 ?shimmerBaseColor
                 :shimmerBaseColorDark,
              child: SizedBox(
                width: _size,
                height: _size,
                child: Container(
                  color: Colors.white,
               ),
             )
           );
         }
       },
     ),
    ),
   );
  }
  
 bool isLight(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }
}

class _CreatedBy extends StatelessWidget {
  static const _maxNameLenght = 22;

  final String name;
  final String? profileUrl;

  const _CreatedBy({required this.name, this.profileUrl});

  @override 
  Widget build(BuildContext context) {
    String finalName = name;
    if (finalName.length > _maxNameLenght) {
      finalName = '${name.substring(0, _maxNameLenght - 3)},,,';
    }

  Widget usernameWidget;
  if (profileUrl != null) {
    usernameWidget = TextButton(
      onPressed: () async {
        if (await canLaunch(profileUrl!)) {
          launch(profileUrl!);
        }
      },
      child: Text(finalName),
    );
  }else {
    usernameWidget = Text(finalName);
  }

  return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
      const Text('Created by:'),
      usernameWidget,
     ],
   );
  }
}
