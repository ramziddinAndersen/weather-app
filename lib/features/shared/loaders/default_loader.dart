import 'package:flutter/material.dart';
import 'package:weather_app/core/util/extensions.dart';

class DefaultLoader extends StatelessWidget {
  const DefaultLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: context.colorScheme.onPrimary));
  }
}
