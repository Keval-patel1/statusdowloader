import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:statusdowloader/utility/app_colors.dart';
import 'package:statusdowloader/utility/app_strings.dart';

import '../utility/app_fonts.dart';

Widget commonButton({required String str,required ,required void Function() onTap,double? width}){
  return InkWell(
    onTap: onTap,
    child: Container(
    width:width?? 200,
    height: 42,
    decoration: BoxDecoration(
borderRadius: BorderRadius.circular(60),
    color: AppColor.colorGreen,
),

child: Center(child: Text(str,style: TS.fontStyle.sfFont16(AppColor.whiteColor,fontWeight: FontWeight.w500),)),

    ),
  );
}