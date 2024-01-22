import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statusdowloader/main.dart';
import 'package:statusdowloader/utility/app_colors.dart';
import 'package:statusdowloader/utility/app_images.dart';
import 'package:statusdowloader/utility/app_sizer.dart';
import 'package:statusdowloader/utility/language/localization_service.dart';
import '../../utility/app_fonts.dart';
import '../../utility/app_strings.dart';
import '../../widgets/common_appbar.dart';
class AppLanguage extends StatefulWidget {
  const AppLanguage({super.key});

  @override
  State<AppLanguage> createState() => _AppLanguageState();
}

class _AppLanguageState extends State<AppLanguage> {
  List string=[
    AppString.strEnglish,
    AppString.strFrench,
    AppString.strSpanish,
    AppString.strItalian,
    AppString.strGerman,
    AppString.strJapanese,
    AppString.strChinese,
  ];
  List str=[
    AppString.strEnglish,
    AppString.strFrench,
    AppString.strSpanish,
    AppString.strItalian,
    AppString.strGerman,
    AppString.strJapanese,
    AppString.strChinese,
  ];
  List image=[
    AppImages.iconFrench,
    AppImages.iconSpanish,
    AppImages.iconItalian,
    AppImages.iconGerman,
    AppImages.iconJapan,
    AppImages.iconChinese,
    AppImages.iconChinese,
  ];

  @override
  void initState() {
    appController.selectLanguage.value=-1;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
             CommonAppBar(str: AppString.strSetting.tr, isTrailIcon: false,widget:
      Obx(()=>  appController.selectLanguage.value==-1?SizedBox():
             InkWell(
               borderRadius: BorderRadius.circular(12),
                 onTap: (){
                   LocalizationService().changeLocale(string[appController.selectLanguage.value]);
                   Get.back();
                 },
                 child: Padding(
                   padding: const EdgeInsets.only(left: 16,right: 8,top: 16,bottom: 16),
                   child: Image.asset(AppImages.iconSelected,width: 25,),
                 )))),
            hBox(height: 40),
            ListView.builder(
                itemCount: image.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
              return Obx(() =>  selectLanguage(onTap: (){
                appController.selectLanguage.value=index;

              },name: str[index] ,map: image[index],isSelected:appController.selectLanguage.value==index? true:false));
            }),

          ],
        ),
      ),
    );
  }
}
Widget selectLanguage({required void Function()? onTap,required String name,required String map,required bool isSelected}){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration:  BoxDecoration(
                color: isSelected?AppColor.colorGreen: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: AppColor.colorWhiteAccent2,blurRadius: 2,offset: Offset(0, 2)),
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
              child: Row(
                children: [
                  Image.asset(map,width: 40,),
                  wBox(width: 12),
                  Text(name.tr,style: TS.fontStyle.sfFont16(isSelected?AppColor.whiteColor:AppColor.blackColor,fontWeight: FontWeight.w500),),
                ],
              ),
            ),
          ),
        ),
      );
}

