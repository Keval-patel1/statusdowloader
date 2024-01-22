import 'package:appinio_social_share/appinio_social_share.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share_plus/share_plus.dart';
import 'package:statusdowloader/utility/app_colors.dart';
import 'package:statusdowloader/utility/app_fonts.dart';
import 'package:statusdowloader/utility/app_images.dart';
import 'package:statusdowloader/utility/app_sizer.dart';
import 'package:statusdowloader/utility/app_strings.dart';

import '../../widgets/common_button.dart';

void downloadStatus(imagePath,context)async{
  await ImageGallerySaver.saveFile(imagePath)
      .then((value) {


        showDialog(

      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              borderRadius: BorderRadius.circular(12),

              child: Container(
                width: MediaQuery.of(context).size.width*.7,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    hBox(height: 20),

                    Image.asset(AppImages.iconCorrect,width: 100,),
                    hBox(height: 20),

                      Text(AppString.strstatusSaved.tr,style: TS.fontStyle.sfFont16(AppColor.blackColor,fontWeight: FontWeight.w500),),
                    hBox(height: 20),
                    commonButton(str: AppString.strOk.tr,onTap: () {
                      Get.back();
                    },),
                    hBox(height: 20),
                    
                ],),
              ),
            ),
          ],
        );
      },
    );
    // flutterToast(str: AppString.strstatusSaved);
  });
}

void shareStatus(imagePath)async{
  await Share.shareFiles([imagePath]);
}
void shareWhatsapp(imagePath)async{
  AppinioSocialShare appinioSocialShare = AppinioSocialShare();
  appinioSocialShare.shareToWhatsapp("",filePaths: [imagePath]);
  // try{
// if(await canLaunchUrl(Uri.parse("whatsapp://send?phone=+919898515266"))){
//
// }
//   }catch(e){
//     print("e");
//   }
}