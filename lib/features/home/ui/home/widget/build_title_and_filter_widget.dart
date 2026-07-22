import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/constants/app_string.dart';

import '../../../../../core/utils/constants/app_svg.dart';
import '../../../../../core/utils/extensions/extension.dart';

class BuildTitleAndFilterWidget extends StatelessWidget {
  const BuildTitleAndFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: context.h * 0.02),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(
            "All Worlds",
            style: context.textTheme.titleLarge?.copyWith(
              fontFamily: AppString.sofiaPro,
              fontWeight: FontWeight.w900,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: context.onSurface, width: 2),
              shape: BoxShape.circle,
            ),
            height: context.h * 0.050,
            width: context.h * 0.050,
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppSvg.filter,
                colorFilter: ColorFilter.mode(
                  context.onSurface,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
