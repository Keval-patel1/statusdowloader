import 'dart:async';

import 'package:get/get.dart';
import 'package:notification_reader/NotificationData.dart';
import 'package:notification_reader/notification_reader.dart';

class AppController extends GetxController{
  RxBool statusAvailability=false.obs;
  RxBool statusCircularView=false.obs;
  RxBool statusNightMode=false.obs;
  RxBool statusAds=false.obs;

  RxInt selectLanguage     = 0.obs;
@override
  void onReady() {
  print("data1");
  super.onReady();
  }



}