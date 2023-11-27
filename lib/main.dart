import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/api/api_provider.dart';
import 'core/constants/app_constants.dart';
import 'core/router/app_router.dart';
import 'core/theme/export.dart';
import 'core/util/logging/logging.dart';
import 'features/home/presentation/cubit/home_cubit.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  // Initialize
  WidgetsFlutterBinding.ensureInitialized();

  // DI initialization
  await di.init();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  // Portrait mode only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  /// For logging
  setUpLogging();

  // For API calls
  ApiProvider.create();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  // Navigator
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<HomeCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (_, child) {
          return MaterialApp.router(
            title: AppConstants.appName,
            theme: appTheme,
            builder: BotToastInit(), // For toast messages (error messages)
            debugShowCheckedModeBanner: false,
            routerConfig: _appRouter.config(
              navigatorObservers: () => [BotToastNavigatorObserver()],
            ),
          );
        },
      ),
    );
  }
}
