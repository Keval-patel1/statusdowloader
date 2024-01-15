import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statusdowloader/utility/app_images.dart';

import '../utility/app_colors.dart';
import '../utility/app_fonts.dart';
import '../utility/app_sizer.dart';
import '../utility/app_strings.dart';
import 'common_back_button.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({this.isTrailIcon,this.str, super.key});
  final isTrailIcon;
  final str;
  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(
                      height: 55,
                      child: CustomBackButton()
                  ),
                  wBox(width: 16),
                  Text(
                    str,
                    style: TS.fontStyle.sfFont18(AppColor.blackColor,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              isTrailIcon==true? Image.asset(AppImages.iconQuestion,width: 24,):SizedBox(),
            ],
          ),
        ),
        Divider(
          height: 1,
          color: AppColor.blackColor.withOpacity(0.2),
        ),
      ],
    );

  }
}
