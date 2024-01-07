import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statusdowloader/screens/status_screen/status_screen.dart';
import 'package:statusdowloader/utility/app_colors.dart';
import 'package:statusdowloader/utility/app_fonts.dart';
import 'package:statusdowloader/utility/app_images.dart';
import 'package:statusdowloader/utility/app_strings.dart';
import 'package:statusdowloader/utility/app_sizer.dart';
import '';
/// Select status saver
class SelectStatusSaver extends StatefulWidget {
  SelectStatusSaver({super.key});

  @override
  State<SelectStatusSaver> createState() => _SelectStatusSaverState();
}

class _SelectStatusSaverState extends State<SelectStatusSaver> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 55,
              child: Center(
                child: Text(AppString.strStatusSaver,
                    style: TS.fontStyle.sfFont18(AppColor.blackColor,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            Divider(
              height: 1,
              color: AppColor.blackColor.withOpacity(0.2),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      hBox(height: 16),
                      Text(AppString.strWaStatusSaver,
                          style: TS.fontStyle.sfFont16(AppColor.blackColor,
                              fontWeight: FontWeight.w500)),
                      hBox(height: 16),
                      InkWell(
                        onTap: (){
                        Get.to(()=> StatusScreen());
                        },
                        child: Image.asset(
                          AppImages.statusSaverImage,
                          height: 100,
                          width: w,
                        ),
                      ),
                      hBox(height: 16),
                      Image.asset(
                        AppImages.downloadImage,
                        height: 100,
                        width: w,
                      ),
                      hBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            AppImages.moreVideoImage,
                            width: w * .4,
                          ),
                          wBox(width: 16),
                          Image.asset(
                            AppImages.whatsappWebImage,
                            width: w * .4,
                          ),
                        ],
                      ),
                      hBox(height: 16),
                      Text(AppString.strInstaAndYouTubeSaver,
                          style: TS.fontStyle.sfFont16(AppColor.blackColor,
                              fontWeight: FontWeight.w500)),
                      hBox(height: 10),
                      Image.asset(
                        AppImages.instaStorySaverImage,
                        height: 80,
                      ),
                      hBox(height: 4),
                      Image.asset(
                        AppImages.instaReelSaverImage,
                        height: 80,
                      ),
                      hBox(height: 4),
                      Image.asset(
                        AppImages.youtubeShortVideoImage,
                        height: 80,
                      ),
                      hBox(height: 10),
                      Text(
                        AppString.strRecoverChat,
                        style: TS.fontStyle.sfFont16(AppColor.blackColor,
                            fontWeight: FontWeight.w500),
                      ),
                    hBox(height: 16),
                      Row(crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.recoverChatImage,
                            width: w * .35,

                          ),
                          wBox(width: 16),
                          Image.asset(
                            AppImages.olderStatusImage,
                            width: w * .35,
                          ),
                        ],
                      ),
                      hBox(height: 16),
                      Image.asset(AppImages.appSettingImage,height: 80,),
                      hBox(height: 16),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
