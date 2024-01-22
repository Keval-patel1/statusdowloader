import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:statusdowloader/utility/app_colors.dart';
import 'package:statusdowloader/utility/app_images.dart';
import 'package:statusdowloader/utility/app_toast.dart';

import '../../../../utility/app_strings.dart';
import '../../../../widgets/common_appbar.dart';
import '../../functions.dart';

class ImageView extends StatefulWidget {
  final String? imagePath;
  const ImageView({Key? key, this.imagePath}) : super(key: key);

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  ///list of buttons
  List<Widget> buttonsList =  [
    Image.asset(AppImages.iconWhatsapp),
    Image.asset(AppImages.iconDownload),
    Image.asset(AppImages.iconShare),

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
             CommonAppBar(str: AppString.strStatus.tr,isTrailIcon: true),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    image: DecorationImage(

                        fit: BoxFit.contain, image: FileImage(File(widget.imagePath!))),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40,)
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                InkWell(
                    onTap: (){
                      shareWhatsapp(widget.imagePath);
                    },
                    child: Image.asset(AppImages.iconWhatsapp,width: 45,)),InkWell(
                    onTap: ()async{
                      downloadStatus(widget.imagePath,context);
                    },
                    child: Image.asset(AppImages.iconDownload,width: 45,)),InkWell(
                    onTap: ()async{
                      shareStatus(widget.imagePath);
                    },
                    child: Image.asset(AppImages.iconShare,width: 45,)),
              ] ),
        ),
      ),
    );
  }
}
