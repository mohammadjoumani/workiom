import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workiom/core/extension/context_extension.dart';
import 'package:workiom/core/extension/widget_extension.dart';
import 'package:workiom/core/resource/color_manager.dart';
import 'package:workiom/core/resource/font_manager.dart';
import 'package:workiom/core/resource/style_manager.dart';
import 'package:workiom/core/resource/values_manager.dart';

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget({
    super.key,
    required this.hintText,
    this.fillColor,
    this.controller,
    this.prefix,
    // this.prefixIcon,
    // this.prefixText,
    this.suffix,
    this.suffixIcon,
    this.suffixText,
    this.helperText,
    this.errorText = '',
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.maxLength,
    this.maxLines,
    this.inputFormatters = const <TextInputFormatter>[],
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.autofillHints,
    this.textAlign = TextAlign.start,
  });

  final String hintText;
  final Color? fillColor;
  final TextEditingController? controller;
  final Widget? suffix;
  final Widget? suffixIcon;
  final String? suffixText;
  final Widget? prefix;

  // final Widget? prefixIcon;
  // final String? prefixText;
  final String errorText;
  final String? helperText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final GestureTapCallback? onTap;
  final List<TextInputFormatter> inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final bool readOnly;
  final bool enabled;
  final Iterable<String>? autofillHints;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        prefix != null
            ? prefix!.marginOnly(
                end: AppPadding.p8,
              )
            : const SizedBox(),
        Expanded(
          child: TextFormField(
            controller: controller,
            style: StyleManager.getRegularStyle(
              color: ColorManager.colorBlack1,
              fontSize: FontSize.s16,
            ),
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              hintText: hintText,
              fillColor: fillColor,
              // prefix: prefix,
              // prefixIcon: prefixIcon,
              // prefixText: prefixText,
              suffix: suffix,
              suffixIcon: suffixIcon,
              suffixText: suffixText,
              helperText: helperText,
              errorText: errorText.isEmpty ? null : errorText,
              errorMaxLines: 3,
              counterText: '',
            ),
            keyboardType: keyboardType,
            obscureText: obscureText,
            maxLines: obscureText ? 1 : maxLines,
            maxLength: maxLength,
            readOnly: readOnly,
            enabled: enabled,
            textInputAction: textInputAction,
            onTapOutside: (value) => context.dismissKeyboard(),
            autofillHints: autofillHints,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            onTap: onTap,
            textAlign: textAlign,
          ),
        ),
      ],
    );
  }
}
