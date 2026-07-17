import 'package:flutter/material.dart';
import 'package:note_app/core/theme/app_colors.dart';

class DefaultPrimaryBtn extends StatelessWidget {
  final String title;
  final Widget? icon;
  final TextStyle? style;
  final VoidCallback? onTap;
  final bool isLoading;
  final double? width, height;
  final Color? backgroundColor, disabledBackgroundColor;
  final BorderRadius? borderRadius;

  const DefaultPrimaryBtn({
    super.key,
    required this.title,
    this.icon,
    this.style,
    this.onTap,
    this.isLoading = false,
    this.width,
    this.height = 56,
    this.backgroundColor = AppColors.secondary,
    this.borderRadius,
    this.disabledBackgroundColor = AppColors.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          disabledBackgroundColor: disabledBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(20),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[icon!, const SizedBox(width: 12)],
                  Text(title, style: style),
                ],
              ),
      ),
    );
  }
}
