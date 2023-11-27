import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/router/app_router.gr.dart';

import '../../../../core/util/theme/app_theme_extension.dart';
import '../../../shared/shared_widgets.dart';
import '../cubit/home_cubit.dart';
import 'widgets/export.dart';
import 'widgets/search_input_field.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    context.read<HomeCubit>().loadWeatherDataForCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: context.colorScheme.primary,
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state.errorText.isNotEmpty) {
              BotToast.showSimpleNotification(
                title: 'Error',
                subTitle: state.errorText,
                titleStyle: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onError,
                ),
                subTitleStyle: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onError,
                ),
                backgroundColor: context.colorScheme.error,
              );

              context.read<HomeCubit>().clear();
            }
          },
          builder: (context, state) {
            if (state.isLoading) {
              return const DefaultLoader();
            }

            return SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 14.h),
                    SearchInputField(
                      labelText: 'Search city',
                      onFieldSubmitted: (value) {
                        debugPrint(value);
                        context.read<HomeCubit>().getGeoDataFromCityName(cityName: value);
                      },
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          'Today',
                          style: context.textTheme.headlineMedium,
                        ),
                        IconButton(
                          onPressed: () {
                            context.router.push(const SettingsRoute());
                          },
                          icon: const Icon(Icons.settings),
                        )
                      ],
                    ),
                    SizedBox(height: 12.h),
                    const CurrentWeatherSection(),
                    SizedBox(height: 22.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AppText(
                            state.locationText,
                            maxLines: 3,
                            style: context.textTheme.titleLarge,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        const Align(
                          alignment: Alignment.topRight,
                          child: WeatherTypeDropdown(),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    const Expanded(child: WeatherList()),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
