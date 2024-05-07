import 'package:flutter/material.dart';
import 'package:gif/util/values.dart';

class ErrorLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          const Icon(
            Icons.bug_report_outlined,
            size: sizeBigIcon,
          ),
          Padding(
            padding: const EdgeInsets.only(top: marginVertLarge),
            child: Text(
              'Oops...',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: marginVert),
            child: Text(
              'Something went wrong, please contact support if the problem persists.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}