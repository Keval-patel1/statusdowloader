import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:statusdowloader/utility/app_images.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {

    const CustomBackButton({Key? key,}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
                Get.back();
            },
            child: Image.asset(
                AppImages.iconBackArrow,width: 35,
            ),
        );
    }
}
