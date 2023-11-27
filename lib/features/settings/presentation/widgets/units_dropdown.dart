import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/export.dart';
import '../../../../../core/util/extensions.dart';
import '../../../home/presentation/cubit/home_cubit.dart';
import '../../../shared/shared_widgets.dart';

class UnitsDropdown extends StatefulWidget {
  const UnitsDropdown({super.key});

  @override
  State<UnitsDropdown> createState() => _UnitsDropdownState();
}

class _UnitsDropdownState extends State<UnitsDropdown> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(left: 10.w, right: 5.w),
          decoration: BoxDecoration(
            color: context.colorScheme.secondary,
            borderRadius: getBorderRadius(),
          ),
          child: DropdownButton<String>(
            value: state.selectedUnitType,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: AppColors.primaryDarkColor,
            ),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: context.colorScheme.background),
            underline: Container(
              height: 2,
              color: AppColors.white,
            ),
            dropdownColor: AppColors.white,
            onChanged: (String? newValue) {
              context.read<HomeCubit>().changeUnitType(newValue);
            },
            items: state.unitTypesList.map<DropdownMenuItem<String>>(
              (type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: AppText(
                    type,
                    style: context.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: type == state.selectedUnitType
                          ? context.colorScheme.onSecondary
                          : AppColors.grayColor,
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }
}
