import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gif/util/design_utils.dart';

class Loading extends StatelessWidget with DesignUtils {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: isCupertino(context)
          ? const CupertinoActivityIndicator()
          : const CircularProgressIndicator(),
    );
  }
}