import 'package:flutter/material.dart';
import '../../../../../core/utils/extensions/extension.dart';

class BuildActionButtonWidget extends StatelessWidget {
  final TextStyle? style;
  final String title;
  final VoidCallback? onTap;

  const BuildActionButtonWidget({
    super.key,
    required this.onTap,
    this.style,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(title, style: style),
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              // color: note.color,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Icon(Icons.add, color: context.onSurface),
          ),
        ),
      ],
    );
  }
}
