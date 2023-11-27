import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/export.dart';
import '../../../../../core/util/extensions.dart';
import '../../../../../gen/assets.gen.dart';

class SearchInputField extends StatefulWidget {
  const SearchInputField({
    super.key,
    this.labelText,
    this.textInputAction = TextInputAction.search,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
  });

  final String? labelText;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;

  @override
  State<SearchInputField> createState() => _SearchInputFieldState();
}

class _SearchInputFieldState extends State<SearchInputField> {
  late TextEditingController _controller;

  late InputBorder _border;
  late FocusNode _inputFocusNode;

  bool _isFocused = false;
  bool _isEmpty = true;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? TextEditingController();

    _border = const UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.white),
    );

    _inputFocusNode = widget.focusNode ?? FocusNode();

    _controller.addListener(() {
      setState(() {
        _isEmpty = _controller.text.isEmpty;
      });
    });

    _inputFocusNode.addListener(() {
      setState(() {
        _isFocused = _inputFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _inputFocusNode.dispose();
    }
    if (widget.controller == null) {
      _controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 58.h,
            child: TextFormField(
              controller: _controller,
              style: context.textTheme.labelMedium,
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.streetAddress,
              textInputAction: widget.textInputAction,
              focusNode: _inputFocusNode,
              onFieldSubmitted: widget.onFieldSubmitted,
              decoration: InputDecoration(
                isDense: true,
                hintText: widget.labelText,
                hintStyle: context.textTheme.labelMedium?.copyWith(
                  height: 1.2,
                  color: AppColors.white50,
                  fontWeight: FontWeight.w400,
                ),
                focusedBorder: _border,
                border: _border,
                enabledBorder: _border,
                alignLabelWithHint: true,
                contentPadding: EdgeInsets.only(bottom: 8.h),
                suffixIcon: SizedBox(
                  width: _isFocused ? 64.w : 48.w,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (_isFocused && !_isEmpty)
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            _controller.clear();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.w, bottom: 16.h),
                            child: Assets.icons.clear.svg(),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 15.w),
        ElevatedButton(
          onPressed: () {
            if (widget.onFieldSubmitted != null) {
              widget.onFieldSubmitted!(_controller.text);
            }
          },
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 12.w)),
            backgroundColor: MaterialStateProperty.all(AppColors.white),
          ),
          child: const Text('Search'),
        ),
      ],
    );
  }
}
