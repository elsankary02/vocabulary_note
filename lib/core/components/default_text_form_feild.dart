import 'package:flutter/material.dart';
import '../utils/extensions/extension.dart';

import '../theme/app_colors.dart';

class DefaultTextFormField extends StatefulWidget {
  final String? labelText;
  final String? prefixText, suffixText;
  final String? hintText;
  final bool obscureText, autofocus;
  final bool? filled;
  final double radius;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? labelStyle, suffixStyle, style, prefixStyle, hintStyle;
  final int? maxLength;
  final Widget? prefixIcon, suffixIcon;
  final TextEditingController? controller;
  final Function(String value)? onChanged, onFieldSubmitted;
  final String? Function(String? value)? validator;
  final Color? cursorColor, suffixIconColor, prefixIconColor, fillColor;
  final Color enabledBorderColor, focusedBorderColor;
  final bool isPassword;
  final BoxConstraints? prefixIconConstraints;
  const DefaultTextFormField({
    super.key,
    this.labelText,
    this.controller,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.autovalidateMode,
    this.labelStyle,
    this.onFieldSubmitted,
    this.maxLength,
    this.cursorColor,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconColor,
    this.prefixIconColor,
    this.obscureText = false,
    this.isPassword = false,
    this.filled,
    this.fillColor,
    this.autofocus = false,
    this.enabledBorderColor = AppColors.white,
    this.focusedBorderColor = AppColors.white,
    this.prefixText,
    this.suffixText,
    this.suffixStyle,
    this.prefixStyle,
    this.style,
    this.radius = 9,
    this.contentPadding = const EdgeInsets.all(15),
    this.hintText,
    this.hintStyle,
    this.prefixIconConstraints,
  });

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  late bool _obscureText;
  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword ? true : widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:
          widget.style ??
          context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: context.theme.colorScheme.onSurface,
          ),
      autovalidateMode: widget.autovalidateMode,
      autofocus: widget.autofocus,
      validator: widget.validator,
      obscureText: _obscureText,
      controller: widget.controller,
      onChanged: widget.onChanged,
      maxLength: widget.maxLength,
      onFieldSubmitted: widget.onFieldSubmitted,
      cursorColor: widget.cursorColor,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        contentPadding: widget.contentPadding,
        filled: widget.filled,
        fillColor: widget.fillColor,
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
        hintStyle:
            widget.hintStyle ??
            context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: context.theme.colorScheme.onSurface.withAlpha(50),
            ),
        prefixStyle: widget.prefixStyle,
        prefixText: widget.prefixText,
        prefixIconConstraints: widget.prefixIconConstraints,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColors.black,
                ),
              )
            : widget.suffixIcon,
        prefixIconColor: widget.prefixIconColor,
        suffixIconColor: widget.suffixIconColor,
        suffixStyle: widget.suffixStyle,
        suffixText: widget.suffixText,
        labelText: widget.labelText,
        labelStyle:
            widget.labelStyle ??
            context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: context.theme.colorScheme.onSurface.withAlpha(50),
            ),
        enabledBorder: _outlineInputBorder(
          color: widget.enabledBorderColor,
          radius: widget.radius,
        ),
        focusedBorder: _outlineInputBorder(
          color: widget.focusedBorderColor,

          radius: widget.radius,
        ),
        focusedErrorBorder: _outlineInputBorder(
          color: AppColors.red,
          radius: widget.radius,
        ),
        errorBorder: _outlineInputBorder(
          color: AppColors.red,
          radius: widget.radius,
        ),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder({
    required Color color,
    required double radius,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: color),
    );
  }
}
