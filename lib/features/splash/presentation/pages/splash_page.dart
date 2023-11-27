import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/util/extensions.dart';

import '../../../../core/api/export.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../../gen/assets.gen.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    ApiProvider.create();

    Future.delayed(
      const Duration(seconds: 2),
      () async {
        context.router.replace(const HomeRoute());
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Image.asset(Assets.images.logoPng.path, width: 275.w),
        ),
      ),
    );
  }
}
