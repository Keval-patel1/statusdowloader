import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:statusdowloader/controller/app_controller.dart';
import 'package:statusdowloader/main.dart';
import 'package:statusdowloader/screens/select_status_saver/select_status_saver.dart';
import 'package:statusdowloader/utility/app_colors.dart';
import 'package:statusdowloader/utility/app_fonts.dart';
import 'package:statusdowloader/utility/app_images.dart';
import 'package:statusdowloader/utility/app_sizer.dart';

import '../../utility/app_strings.dart';
import '../../widgets/common_appbar.dart';
import 'app_language.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  AppController appController = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             CommonAppBar(str: AppString.strSetting.tr, isTrailIcon: false),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      hBox(height: 20),
                      Text(
                        AppString.strGeneralSetting.tr,
                        style: TS.fontStyle.sfFont16(AppColor.blackColor,
                            fontWeight: FontWeight.w500),
                      ),
                      hBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColor.colorGreen),
                        ),
                        child: Column(
                          children: [
                         Obx(() =>    CommonSwitchListTile(
                                image: AppImages.iconNotification,
                                title: AppString.strStatusAvailability.tr,
                                value: appController.statusAvailability.value,
                                onChanged: (value) {
                                          appController.statusAvailability.value=value;
                                })),
                            Obx(() =>  CommonSwitchListTile(
                                image: AppImages.iconStatusCircular,
                                title: AppString.strStatusCircularNew.tr,
                                value: appController.statusCircularView.value,
                                onChanged: (value) {
                                  appController.statusCircularView.value=value;

                                })),
                           Obx(() =>  CommonSwitchListTile(
                                image: AppImages.iconSun,
                                title: AppString.strNightModeDark.tr,
                                value: appController.statusNightMode.value,
                                onChanged: (value) {
                                  appController.statusNightMode.value=value;
                                      currentTheme.switchTheme();

                                })),
                            Obx(() =>  CommonSwitchListTile(
                                image: AppImages.iconAds,
                                title: AppString.strOptOutOfAdsPersonalization.tr,
                                value: appController.statusAds.value,
                                onChanged: (value) {
                                  appController.statusAds.value=value;

                                })),
                            ],
                        ),
                      ),

                      hBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.colorDownLightGreen,
                          borderRadius: BorderRadius.circular(16),


                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          child: Row(children: [

                            Image.asset(AppImages.iconQuestion2,width: 40,),
                            wBox(width: 16),
                            Text(AppString.strHowItWork.tr,style: TS.fontStyle.sfFont16(AppColor.blackColor,fontWeight: FontWeight.w500),)
                          ],),
                        ),
                      ),
                      hBox(height: 20),

                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.colorDownLightGreen,
                          borderRadius: BorderRadius.circular(16),


                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          child: Row(children: [

                            Image.asset(AppImages.iconChannel,width: 40,),
                            wBox(width: 16),
                            Text(AppString.strJoinChannel.tr,style: TS.fontStyle.sfFont16(AppColor.blackColor,fontWeight: FontWeight.w500),)
                          ],),
                        ),
                      ),

                      hBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text(AppString.strTermOfUse.tr,style: TS.fontStyle.sfFont16(AppColor.blackColor,fontWeight: FontWeight.w400),),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(width: 1,height: 12,color: AppColor.blackColor,),
                        ),
                        Text(AppString.strPrivacyPolicy,style: TS.fontStyle.sfFont16(AppColor.blackColor,fontWeight: FontWeight.w400),),
                      ],),
                      hBox(height: 20),
                      Text(AppString.strAbout,style: TS.fontStyle.sfFont18(AppColor.blackColor,fontWeight: FontWeight.w500),),
                      hBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                  onTap: (){
                                    Get.to(()=> const AppLanguage());
                                  },
                                  child: aboutCard(str: AppString.strAppLanguage, icon: AppImages.iconLanguage, image: AppImages.languageImage)),
                              aboutCard(str: AppString.strWriteSuggestion, icon: AppImages.iconChat, image: AppImages.suggestionImage),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              aboutCard(str: AppString.strClearAppCache, icon: AppImages.iconStars, image: AppImages.cacheImage),
                              aboutCard(str: AppString.strShareApp, icon: AppImages.iconSmallShare, image: AppImages.shareAppImage),
                            ],
                          ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            aboutCard(str: AppString.strRateUs, icon: AppImages.iconStar, image: AppImages.rateUsImage),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
Widget aboutCard({required String str,required String icon,required String image}){
  return Container(
    width: 155,
    height: 50,
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(image,))
    ),
    child: Center(
      child: Row(

        children: [
          wBox(width: 8),
          Image.asset(icon,width: 20,),
          wBox(width: 8),

          Text(str,textAlign: TextAlign.center,style: TS.fontStyle.sfFont14(AppColor.whiteColor,fontWeight: FontWeight.w500),),
          wBox(width: 4),

        ],),
    ),
  );
}
class CommonSwitchListTile extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  CommonSwitchListTile({
    required this.title,
    this.subtitle = '',
    required this.value,
    required this.onChanged,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeColor: AppColor.whiteColor,
      activeTrackColor: AppColor.colorGreen,
      inactiveTrackColor: AppColor.colorGrey2,
      inactiveThumbColor: AppColor.whiteColor,
      trackOutlineColor: MaterialStatePropertyAll(AppColor.whiteColor),
    contentPadding: EdgeInsets.only(left: 12),
      title: Row(
        children: [
          Image.asset(
            image,
            width: 20,
          ),
          wBox(width: 10),
          Text(title,style: TS.fontStyle.sfFont14(AppColor.blackColor,fontWeight: FontWeight.w500),),
        ],
      ),
      subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
      value: value,
      onChanged: onChanged,

    );
  }
}
