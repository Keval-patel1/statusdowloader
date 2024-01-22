import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statusdowloader/utility/app_colors.dart';
import 'package:statusdowloader/utility/app_fonts.dart';
import 'package:statusdowloader/utility/app_images.dart';
import 'package:statusdowloader/utility/app_strings.dart';
import 'package:statusdowloader/widgets/common_button.dart';

class ExitPage extends StatefulWidget {
  const ExitPage({super.key});

  @override
  State<ExitPage> createState() => _ExitPageState();
}

class _ExitPageState extends State<ExitPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(
                height: MediaQuery.of(context).size.height*.50,
                child: Stack(
                  children: [
                    Image.asset(AppImages.exitBG),

                    Positioned(
                        top: 32,
                        left: 16,
                        right: 16,
                        child: Image.asset(AppImages.exitImage,width: 300,)),


                  ],
                ),
              ),
              SizedBox(height: 25,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,

                      boxShadow: const [
                        BoxShadow(color: AppColor.colorWhiteAccent2,blurRadius: 2,offset: Offset(0, 2)),
                      ],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      Text(AppString.strExitApp,style: TS.fontStyle.sfFont24(AppColor.blackColor,fontWeight: FontWeight.w600),),
                      const SizedBox(height: 10,),
                      Text(AppString.strAreYouSureYouWantToExit,style: TS.fontStyle.sfFont16(AppColor.blackColor,fontWeight: FontWeight.w400),),
                      const SizedBox(height: 20,),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            commonButton(str: AppString.strYes, onTap: (){
                              exit(0);
                            },width: 120),
                            commonButton(str: AppString.strNo, onTap: (){
                              Get.back();
                            },width: 120)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
